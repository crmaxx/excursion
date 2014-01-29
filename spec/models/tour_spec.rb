require 'spec_helper'

describe Tour do
  context 'associations' do
    it { should have_and_belong_to_many(:categories) }
    it { should belong_to(:city).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:city_id) }
    it { should validate_presence_of(:name) }
    it {
      FactoryGirl.create(:tour)
      should validate_uniqueness_of(:name)
    }
  end

  context 'scopes' do
    describe '.active' do
      let(:tour) { FactoryGirl.create(:tour) }
      let(:disabled_tour) { FactoryGirl.create(:disabled_tour) }

      it 'includes tours with public flag' do
        Tour.active.should include(tour)
      end

      it 'excludes tours without public flag' do
        Tour.active.should_not include(disabled_tour)
      end
    end
  end
end
