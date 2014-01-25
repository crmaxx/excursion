class Tour < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :city, dependent: :destroy

  validates :city_id, presence: true
  validates :name, presence: true, uniqueness: true

  scope :active, -> { where(public: true) }
end
