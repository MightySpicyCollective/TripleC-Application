require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'Associations' do
    it { should belong_to(:school) }
    it { should have_many(:users) }
  end
end
