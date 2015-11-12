require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'Associations' do
    it { should have_many(:users) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:identifier) }
    it { should validate_uniqueness_of(:identifier).allow_blank }
    it { should allow_value(:teacher).for(:name) }
    it { should allow_value(:student).for(:name) }
    it { should_not allow_value(:admin).for(:name) }
  end
end
