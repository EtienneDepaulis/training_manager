require 'rails_helper'

RSpec.describe '/api/v1/training_sessions', type: :api do

	let(:url) { "/api/v1/training_sessions" }
	let!(:training_session) { create :training_session, started_at: Time.new(2014,7,1,18,30) }
	let!(:user) { create :user }

	context 'index' do
		it "lists training_sessions" do
			getWithAuth "#{url}.json", token: user.token

			expect(last_response.status).to eq 200

			training_sessions = JSON.parse(last_response.body)

			expect(training_sessions["training_sessions"].first["id"]).to eq training_session.id
		end
	end

	context 'show' do
		it "shows a training_session" do
			getWithAuth "#{url}/#{training_session.id}.json", token: user.token

			expect(last_response.status).to eq 200

			result = JSON.parse(last_response.body)

			expect(result["training_session"]["id"]).to eq training_session.id
		end
	end

	context 'create' do
		let(:location) { create :location }
		let(:group) { create :group }

		it "creates a training_session" do
			postWithAuth "#{url}.json", training_session: { started_at: Time.new(2014,8,1,18,30), location_id: location.id }

			expect(last_response.status).to eq 201

			training_session = JSON.parse(last_response.body)

			expect(training_session["training_session"]["location_id"]).to eq location.id
		end

		it "creates a training_session and its allowances" do
			expect{
				postWithAuth "#{url}.json", training_session: { started_at: Time.new(2014,8,1,18,30), location_id: location.id, allowances_attributes: [{group_id: group.id}] }
			}.to change(Allowance, :count).by(1)
		end

		it "raises an error" do
			postWithAuth "#{url}.json", training_session: { started_at: "2014-08-01 18:30:00" }, token: user.token

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["location"]).to eq ["doit être rempli(e)"]

		end
	end

	context 'update' do
		it "updates a training_session" do
			patchWithAuth "#{url}/#{training_session.id}.json", training_session: { started_at: Time.new(2014,7,1,19,30) }, token: user.token

			expect(last_response.status).to eq 204

			expect(training_session.reload.started_at).to eq Time.new(2014,7,1,19,30)
		end

		it "raises an error" do
			patchWithAuth "#{url}/#{training_session.id}.json", training_session: { started_at: nil }, token: user.token

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["started_at"]).to eq ["doit être rempli(e)"]
		end
	end

	context 'destroy' do
		it "destroys a training_session" do
			deleteWithAuth "#{url}/#{training_session.id}.json", token: user.token

			expect(last_response.status).to eq 204
		end
	end
end
