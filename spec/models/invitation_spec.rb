require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to belong_to(:user) }
	it { is_expected.to validate_presence_of(:user) }

	it { is_expected.to belong_to(:training_session) }
	it { is_expected.to validate_presence_of(:training_session) }

	it "has a valid factory" do
		expect(build(:invitation)).to be_valid
	end

	context 'default values' do
		it "isn't answered" do
			expect(build(:invitation).is_answered?).to be_falsy
		end

		it "isn't confirmed" do
			expect(build(:invitation).is_confirmed?).to be_falsy
		end
	end

	context 'when answering' do
		let(:invitation) { create(:invitation) }

		it "changes the is_answered to true after first answer" do
			expect{
				invitation.update_attribute(:is_confirmed, true)
			}.to change(invitation, :is_answered?).from(false).to(true)
		end
	end
end
