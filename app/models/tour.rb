class Tour < ActiveRecord::Base
  include RedisHelpers

  has_and_belongs_to_many :categories
  belongs_to :city, dependent: :destroy

  validates :city_id, presence: true
  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(public: true) }
  scope :recent, ->(limit=5) { active.order('created_at desc').limit(limit) }

  after_save :update_counter_cache
  after_destroy :update_counter_cache

  def to_redis_object
    {
      'c_at'  => Time.now.to_i,
      't_id'  => self.id
    }.to_json
  end

  private
  def update_counter_cache
    unless destroyed?
      self.city.tours_count = Tour.active.where('city_id = ?', self.city.id).count
      self.city.save
    end
  end
end
