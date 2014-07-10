require 'rails_helper'

RSpec.describe '/api/v1/users', type: :api do

	let(:url) { "/api/v1/users" }

	context 'index' do

		before(:each) do
		  create :user, name: "Etienne"
		end

		it "lists users" do
			get "#{url}.json"

			expect(last_response.status).to eq 200

			users = JSON.parse(last_response.body)

			expect(users["users"].first["name"]).to eq "Etienne"
		end
	end
end
