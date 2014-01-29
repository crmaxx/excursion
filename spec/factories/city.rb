FactoryGirl.define do
  sequence :city_name do |n|
    "City#{n}"
  end

  factory :city do
    name { FactoryGirl.generate(:city_name) }
  end
end
