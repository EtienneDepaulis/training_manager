require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
	it { is_expected.to validate_presence_of(:started_at) }

  it { is_expected.to belong_to(:location) }
	it { is_expected.to validate_presence_of(:location) }
end
