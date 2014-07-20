require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it { is_expected.to belong_to(:user) }
	it { is_expected.to validate_presence_of(:user) }

	it { is_expected.to belong_to(:training_session) }
	it { is_expected.to validate_presence_of(:training_session) }

	it { is_expected.to ensure_inclusion_of(:status).in_array(Invitation::AVAILABLE_STATUS) }

	it "has a valid factory" do
		expect(build(:invitation)).to be_valid
	end
end
