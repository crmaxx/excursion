require 'spec_helper'

describe Tour do
  context 'associations' do
    it { should have_and_belong_to_many(:categories) }
    it { should belong_to(:city).dependent(:destroy) } }
  end

  context 'validations' do
    it { should validate_presence_of(:city_id) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
