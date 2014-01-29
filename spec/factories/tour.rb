FactoryGirl.define do
  sequence :tour_name do |n|
    "Awesome excursion #{n}"
  end

  factory :tour do
    name { FactoryGirl.generate(:tour_name) }
    description 'Some big description'
    association :city
    public true
  end

  factory :disabled_tour, parent: :tour do
    public false
  end
end
