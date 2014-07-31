require 'rails_helper'

RSpec.describe Allowance, type: :model do
  it { is_expected.to belong_to(:group) }
	it { is_expected.to validate_presence_of(:group) }

	it { is_expected.to belong_to(:training_session) }
	it { is_expected.to validate_presence_of(:training_session) }

	it "has a valid factory" do
		expect(build(:allowance)).to be_valid
	end

	context 'invitations management' do
		context 'on create' do
			before(:each) do
			  @group = create :group
			  @another_group = create :group
			  @user = create :user, group: @group

			  @training_session = create :training_session
			end

			it "does nothing if no users" do
				expect{
					create :allowance, group: @another_group, training_session: @training_session
				}.not_to change(Invitation, :count)
			end

			it "creates invitations for all group's users" do
				expect{
					create :allowance, group: @group, training_session: @training_session
				}.to change(Invitation, :count).by(1)

				expect(@user.training_sessions.reload).to include(@training_session)
			end
		end

		context 'on delete' do
			before(:each) do
			  @group = create :group
			  @another_group = create :group
			  @user = create :user, group: @group

			  @training_session = create :training_session
			  @allowance = create :allowance, group: @group, training_session: @training_session
			end

			it "destroy invitations for all group's users" do
				expect{
					@allowance.destroy
				}.to change(Invitation, :count).by(-1)

				expect(@user.training_sessions.reload).not_to include(@training_session)
			end

		end
	end
end
