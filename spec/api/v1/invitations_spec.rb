require 'rails_helper'

RSpec.describe '/api/v1/invitations', type: :api do

	let(:url) { "/api/v1/invitations" }
	let!(:user) { create :user }
	let!(:invitation) { create :invitation, user: user }

	context 'index' do
		it "lists invitations" do
			getWithAuth "#{url}.json"

			expect(last_response.status).to eq 200

			invitations = JSON.parse(last_response.body)

			expect(invitations["invitations"].first["user_id"]).to eq user.id
		end

		it "list only the user's invitations" do
			create :invitation

			getWithAuth "#{url}.json"

			invitations = JSON.parse(last_response.body)

			expect(invitations["invitations"].size).to eq 1
		end
	end

	context 'show' do
		it "shows a invitation" do
			getWithAuth "#{url}/#{invitation.id}.json"

			expect(last_response.status).to eq 200

			invitation = JSON.parse(last_response.body)

			expect(invitation["invitation"]["user_id"]).to eq user.id
		end
	end


	context 'update' do
		it "updates a invitation" do
			patchWithAuth "#{url}/#{invitation.id}.json", invitation: { is_confirmed: true }

			expect(last_response.status).to eq 204

			expect(invitation.reload.is_confirmed?).to be_truthy
			expect(invitation.reload.is_answered?).to be_truthy
		end
	end
end
