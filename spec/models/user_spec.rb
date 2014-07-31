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

	context 'invitations management' do
		context 'user created' do
			before(:each) do
			  @group = create :group
			  @training_session_1 = create :training_session
			  @training_session_2 = create :training_session

			  @group.training_sessions << @training_session_1
			end

			let(:user) { build :user }

			it "does nothing" do
				expect{
					user.save
				}.not_to change(Invitation, :count)
			end

			it "creates the invitations" do
				user.group = @group
				expect{
					user.save
				}.to change(Invitation, :count).by(1)

				expect(user.training_sessions.reload).to include(@training_session_1)
			end

		end

		context 'user changed group' do
			before(:each) do
			  @group = create :group
			  @new_group = create :group
			  @training_session_1 = create :training_session
			  @training_session_2 = create :training_session

			  @group.training_sessions << @training_session_1
			  @new_group.training_sessions << @training_session_2

			  @user = create :user, group: @group
			end

			it "update invitations based on the new group" do
				@user.group = @new_group
				@user.save
				@user.training_sessions.reload

				expect(@user.training_sessions.size).to eq 1
				expect(@user.training_sessions).to include(@training_session_2)
			end

		end
	end
end