require 'rails_helper'

RSpec.describe '/api/v1/locations', type: :api do

	let(:url) { "/api/v1/locations" }
	let!(:location) { create :location, name: "Piscine" }
	let!(:user) { create :user }

	context 'index' do
		it "lists locations" do
			getWithAuth "#{url}.json"

			expect(last_response.status).to eq 200

			locations = JSON.parse(last_response.body)

			expect(locations["locations"].first["name"]).to eq "Piscine"
		end
	end

	context 'filtering on ids' do
		let!(:other_location) { create :location }

		it "filters locations on id" do
			getWithAuth "#{url}.json", ids: [other_location.id]

			expect(last_response.status).to eq 200

			locations = JSON.parse(last_response.body)

			expect(locations["locations"].first["id"]).to eq other_location.id
			expect(locations["locations"].size).to eq 1
		end
	end

	context 'show' do
		it "shows a location" do
			getWithAuth "#{url}/#{location.id}.json"

			expect(last_response.status).to eq 200

			location = JSON.parse(last_response.body)

			expect(location["location"]["name"]).to eq "Piscine"
		end
	end

	context 'create' do
		it "creates a location" do
			postWithAuth "#{url}.json", location: { name: 'Club' }

			expect(last_response.status).to eq 201

			location = JSON.parse(last_response.body)

			expect(location["location"]["name"]).to eq "Club"
		end

		it "raises an error" do
			postWithAuth "#{url}.json", location: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

		end
	end

	context 'update' do
		it "updates a location" do
			patchWithAuth "#{url}/#{location.id}.json", location: { name: 'Salle de muscu' }

			expect(last_response.status).to eq 204

			expect(location.reload.name).to eq "Salle de muscu"
		end

		it "raises an error" do
			patchWithAuth "#{url}/#{location.id}.json", location: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
		end
	end

	context 'destroy' do
		it "destroys a location" do
			deleteWithAuth "#{url}/#{location.id}.json"

			expect(last_response.status).to eq 204
		end
	end
end
