class City < ActiveRecord::Base
  has_many :tours

  validates :name, presence: true, uniqueness: true
end
