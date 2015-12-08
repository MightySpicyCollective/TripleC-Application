require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end
end
