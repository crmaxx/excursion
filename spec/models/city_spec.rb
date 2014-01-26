require 'spec_helper'

describe City do
  context 'associations' do
    it { should have_many(:tours) }
  end

  context 'validations' do
    it { should validate_presence_of(:tours_count) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
