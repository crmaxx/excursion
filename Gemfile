source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=work

gem 'rails', '4.0.2'

gem 'pg', '0.15.1'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass', '~> 3.0.3.0'

gem 'activeadmin', github: 'gregbell/active_admin'

gem 'hiredis', '~> 0.4.5'
gem 'redis', '>= 2.2.0', require: ['redis', 'redis/connection/hiredis']

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'powify'
  gem 'pry'
end

group :development, :test do
  gem 'rspec-rails', '2.13.1'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'simplecov', require: false
end
