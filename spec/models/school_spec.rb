require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end
  describe 'Associations' do
    it { should have_many(:classrooms).dependent(:destroy) }
  end
end
