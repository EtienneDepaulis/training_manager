require 'rails_helper'

RSpec.describe '/api/v1/users', type: :api do

	let(:url) { "/api/v1/users" }
	let!(:user) { create :user, name: "Etienne" }

	context 'index' do
		it "lists users" do
			get "#{url}.json"

			expect(last_response.status).to eq 200

			users = JSON.parse(last_response.body)

			expect(users["users"].first["name"]).to eq "Etienne"
		end
	end

	context 'show' do
		it "shows a user" do
			get "#{url}/#{user.id}.json"

			expect(last_response.status).to eq 200

			user = JSON.parse(last_response.body)

			expect(user["user"]["name"]).to eq "Etienne"
		end
	end

	context 'create' do
		it "creates a user" do
			post "#{url}.json", user: { name: 'Stéphane' }

			expect(last_response.status).to eq 201

			user = JSON.parse(last_response.body)

			expect(user["user"]["name"]).to eq "Stéphane"
		end

		it "raises an error" do
			post "#{url}.json", user: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

		end
	end

	context 'update' do
		it "updates a user" do
			patch "#{url}/#{user.id}.json", user: { name: 'Stéphane' }

			expect(last_response.status).to eq 204

			expect(user.reload.name).to eq "Stéphane"
		end

		it "raises an error" do
			patch "#{url}/#{user.id}.json", user: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
		end
	end

	context 'destroy' do
		it "destroys a user" do
			delete "#{url}/#{user.id}.json"

			expect(last_response.status).to eq 204
		end
	end
end
