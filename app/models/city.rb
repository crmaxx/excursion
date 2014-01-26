class City < ActiveRecord::Base
  has_many :tours

  validates :tours_count, presence: true
  validates :name, presence: true, uniqueness: true

  scope :with_tours, -> { where('tours_count > ?', 0) }
end
