require 'rails_helper'

RSpec.describe User, type: :model do
	it { is_expected.to validate_presence_of(:name) }

	it { is_expected.to belong_to(:group) }
	it { is_expected.to validate_presence_of(:group) }

	it { is_expected.to have_many(:invitations).dependent(:destroy) }
	it { is_expected.to have_many(:training_sessions) }

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

	context 'token creation' do
		let(:group) { create :group }
		it "creates a token" do
			expect(group.users.create(name: "Etienne").token).not_to be_blank
		end
	end
end