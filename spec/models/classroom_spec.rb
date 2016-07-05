require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'Associations' do
    it { should belong_to(:school) }
    it { should belong_to(:teacher) }
    it { should have_many(:users) }
    it { should have_many(:projects).through(:users) }
    it { should have_many(:sent_invites).dependent(:destroy) }
    it { should have_many(:recieved_invites).dependent(:destroy) }
  end

  describe 'Instance Methods' do
    describe 'connected_with?' do
      before do
        @classroom1 = FactoryGirl.create(:classroom)
        @classroom2 = FactoryGirl.create(:classroom)
        @invite = Invite.create(sender_id: @classroom1.id, reciever_id: @classroom2.id)
        @invite.accept!
      end
      it { expect(@classroom1.connected_with?(@classroom2.id)).to be true }
      it { expect(@classroom2.connected_with?(@classroom1.id)).to be true }
    end
  end
end
