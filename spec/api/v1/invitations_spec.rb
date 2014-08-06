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
			patchWithAuth "#{url}/#{invitation.id}.json", invitation: { status: 'confirmed' }

			expect(last_response.status).to eq 204

			expect(invitation.reload.status).to eq "confirmed"
		end

		it "raises an error" do
			patchWithAuth "#{url}/#{invitation.id}.json", invitation: { status: 'unknown status' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["status"]).to eq ["n'est pas inclus(e) dans la liste"]
		end
	end
end
