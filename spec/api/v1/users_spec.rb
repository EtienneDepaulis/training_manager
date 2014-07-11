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
end
