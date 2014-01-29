# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
$redis.ltrim("#{Tour::REDIS_PREFIX}:#{AdminUser.first.id}", 0, 0)

Tour.destroy_all
City.destroy_all
Category.destroy_all

cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }, { name: 'Moscow' }, { name: 'Vladimir' }])
Category.create!([{ name: 'Historical' }, { name: 'Urban' }, { name: 'Natural' }, { name: 'Museum' }])

Tour.create!(name: 'Awesome tour 1', city: cities.first, public: true, description: 'Awesome tour description 1',
  categories: Category.where(name: ['Historical', 'Urban']))
Tour.create!(name: 'Awesome tour 2', city: cities.last, description: 'Awesome tour description 2',
  categories: Category.where(name: ['Natural', 'Museum']))
Tour.create!(name: 'Awesome tour 3', city: cities.first, public: true, description: 'Awesome tour description 3',
  categories: Category.where(name: ['Historical', 'Museum']))
Tour.create!(name: 'Awesome tour 4', city: cities.first, public: true, description: 'Awesome tour description 4',
  categories: Category.where(name: ['Historical', 'Museum']))
Tour.create!(name: 'Awesome tour 5', city: cities.first, public: true, description: 'Awesome tour description 5',
  categories: Category.where(name: ['Historical', 'Museum']))
Tour.create!(name: 'Awesome tour 6', city: cities.first, public: true, description: 'Awesome tour description 6',
  categories: Category.where(name: ['Historical', 'Museum']))
Tour.create!(name: 'Awesome tour 7', city: cities.first, public: true, description: 'Awesome tour description 7',
  categories: Category.where(name: ['Historical', 'Museum']))
