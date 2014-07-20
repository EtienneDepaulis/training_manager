require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
	it { is_expected.to validate_presence_of(:started_at) }

  it { is_expected.to belong_to(:location) }
	it { is_expected.to validate_presence_of(:location) }

	it { is_expected.to have_many(:allowances) }
	it { is_expected.to have_many(:groups) }

	it "has a valid factory" do
		expect(build(:training_session)).to be_valid
	end
end
