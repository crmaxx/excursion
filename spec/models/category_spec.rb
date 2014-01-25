require 'spec_helper'

describe Category do
  context 'associations' do
    it { should have_and_belong_to_many(:excursions) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
