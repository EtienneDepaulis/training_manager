require 'rails_helper'

RSpec.describe "managing invitations", type: :feature do

  let(:group)               { create :group }
  let(:other_group)         { create :group }
  let(:user)                { create :user, groups: [group] }

  let(:location)            { create :location }

  context "answer invitation" do
    let!(:training_session)    { create :training_session, groups: [group], location: location }

    it "can answer invitation" do
      sign_in_with user

      expect(page).to have_content(training_session)
    end
  end


end