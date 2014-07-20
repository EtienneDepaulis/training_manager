require 'rails_helper'

RSpec.describe Allowance, type: :model do
  it { is_expected.to belong_to(:group) }
	it { is_expected.to validate_presence_of(:group) }

	it { is_expected.to belong_to(:training_session) }
	it { is_expected.to validate_presence_of(:training_session) }

	it "has a valid factory" do
		expect(build(:allowance)).to be_valid
	end
end
