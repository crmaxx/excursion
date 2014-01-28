module RedisHelpers
  extend ActiveSupport::Concern

  REDIS_PREFIX        = :actistrm
  KEEP_ACTIVITY_ITEMS = 3

  # push the activity-id into the queue
  def add_to_queue!(user)
    $redis.lpush(self.class.redis_key_for_user(user), to_redis_object)
  end

  # trims the list (queue) to a length, pushing out older items
  def trim_queue!(user)
    $redis.ltrim(self.class.redis_key_for_user(user), 0, KEEP_ACTIVITY_ITEMS)
  end

  # removes the activity-id from the users stream
  def remove_from_queue!(user)
    $redis.lrem(self.class.redis_key_for_user(user), 0, to_redis_object)
  end

  module ClassMethods
    def redis_key_for_user(user)
      "#{REDIS_PREFIX}:#{user.id}"
    end

    # fetch the latest elements from the queue
    def fetch_latest_from_queue(user)
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
  end
end
