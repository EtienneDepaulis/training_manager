require 'rails_helper'

RSpec.describe User, type: :model do
	it { is_expected.to validate_presence_of(:name) }

	it { is_expected.to belong_to(:group) }
	it { is_expected.to validate_presence_of(:group) }

	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end
end