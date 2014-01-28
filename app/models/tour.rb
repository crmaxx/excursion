class Tour < ActiveRecord::Base
  REDIS_PREFIX        = :actistrm
  KEEP_ACTIVITY_ITEMS = 3

  has_and_belongs_to_many :categories
  belongs_to :city, dependent: :destroy

  validates :city_id, presence: true
  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(public: true) }
  scope :recent, ->(limit=5) { active.order('created_at desc').limit(limit) }

  #after_initialize :update_activity
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  def to_redis_object
    redis_object = {
      'c_at'  => Time.now.to_i,
      't_id'  => id
    }

    redis_object.to_json
  end

  def self.redis_key_for_user(user)
    "#{REDIS_PREFIX}:#{user.id}"
  end

  # push the activity-id into the queue
  def add_to_queue(user)
    $redis.lpush(redis_key_for_user(user), self.to_redis_object)
    #self.updated_at = Time.now.to_i
  end

  # trims the list (queue) to a length, pushing out older items
  def trim_queue(user)
    $redis.ltrim(redis_key_for_user(user), 0, KEEP_ACTIVITY_ITEMS)
  end

  # removes the activity-id from the users stream
  def remove_from_queue(user)
    $redis.lrem(redis_key_for_user(user), 0, self.to_redis_object)
  end

  # fetch the latest elements from the queue
  def self.fetch_latest_from_queue(user)
    redis_activity = $redis.lrange(redis_key_for_user(user), 0, KEEP_ACTIVITY_ITEMS - 1)
    preload_tour_ids  = []

    redis_activity.map do |activity_json|
      activity_json = JSON.parse(activity_json)
      preload_tour_ids << activity_json['t_id']
    end
    preload_tour_ids = preload_tour_ids.compact.map(&:to_i).uniq
    tours = Tour.active.where(id: preload_tour_ids).order('updated_at desc') if preload_tour_ids
    tours
  end

  private
  def update_counter_cache
    self.city.tours_count = Tour.active.where('city_id = ?', self.city.id).count
    self.city.save
  end

  def update_activity
    add_to_queue(self.user, self)
    trim_queue(self.user)
  end
end
