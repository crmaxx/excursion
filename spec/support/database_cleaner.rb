REDIS_URL = "redis://#{REDIS_CONFIG['password'].blank? ? '' : ":#{REDIS_CONFIG['password']}"}@#{REDIS_CONFIG['address']}:#{REDIS_CONFIG['port']}/#{REDIS_CONFIG['db']}"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner[:redis, {connection: REDIS_URL} ].strategy = :truncation
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
