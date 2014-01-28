require 'yaml'

rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/../..'
rails_env  = ENV['RAILS_ENV'] || 'development'

REDIS_CONFIG = YAML.load(
  ERB.new(
    File.read(File.join(rails_root, 'config', 'redis.yml'))
  ).result
)[rails_env]

$redis = Redis.new(
  host:     REDIS_CONFIG['address'],
  port:     REDIS_CONFIG['port'],
  db:       REDIS_CONFIG['db'],
  password: REDIS_CONFIG['password']
)
