require 'rails_helper'

RSpec.describe '/api/v1/locations', type: :api do

	let(:url) { "/api/v1/locations" }
	let!(:location) { create :location, name: "Piscine" }
	let!(:user) { create :user }

	context 'index' do
		it "lists locations" do
			get "#{url}.json", token: user.token

			expect(last_response.status).to eq 200

			locations = JSON.parse(last_response.body)

			expect(locations["locations"].first["name"]).to eq "Piscine"
		end
	end

	context 'show' do
		it "shows a location" do
			get "#{url}/#{location.id}.json", token: user.token

			expect(last_response.status).to eq 200

			location = JSON.parse(last_response.body)

			expect(location["location"]["name"]).to eq "Piscine"
		end
	end

	context 'create' do
		it "creates a location" do
			post "#{url}.json", location: { name: 'Club' }, token: user.token

			expect(last_response.status).to eq 201

			location = JSON.parse(last_response.body)

			expect(location["location"]["name"]).to eq "Club"
		end

		it "raises an error" do
			post "#{url}.json", location: { name: '' }, token: user.token

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

		end
	end

	context 'update' do
		it "updates a location" do
			patch "#{url}/#{location.id}.json", location: { name: 'Salle de muscu' }, token: user.token

			expect(last_response.status).to eq 204

			expect(location.reload.name).to eq "Salle de muscu"
		end

		it "raises an error" do
			patch "#{url}/#{location.id}.json", location: { name: '' }, token: user.token

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
		end
	end

	context 'destroy' do
		it "destroys a location" do
			delete "#{url}/#{location.id}.json", token: user.token

			expect(last_response.status).to eq 204
		end
	end
end
