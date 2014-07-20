require 'rails_helper'

RSpec.describe Group, type: :model do
	it { is_expected.to validate_presence_of(:name) }

	it { is_expected.to belong_to(:parent) }
	it { is_expected.to have_many(:children) }

	it { is_expected.to have_many(:allowances) }
	it { is_expected.to have_many(:training_sessions) }

	it "has a valid factory" do
		expect(build(:group)).to be_valid
	end
end