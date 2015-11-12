require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:role_id) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'Associations' do
    it { should belong_to(:role) }
    it { should belong_to(:classroom) }
    it { should have_many(:projects).dependent(:destroy) }
  end
end
