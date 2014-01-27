$redis = Redis.new(
  host:     REDIS_CONFIG['address'],
  port:     REDIS_CONFIG['port'],
  db:       REDIS_CONFIG['db'],
  password: REDIS_CONFIG['password']
)
