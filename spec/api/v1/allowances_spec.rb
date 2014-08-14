require 'rails_helper'

RSpec.describe '/api/v1/allowances', type: :api do

	let(:url) { "/api/v1/allowances" }
	let!(:user) { create :user }
	let!(:allowance) { create :allowance }

	context 'index' do
		it "lists allowances" do
			getWithAuth "#{url}.json"

			expect(last_response.status).to eq 200

			allowances = JSON.parse(last_response.body)

			expect(allowances["allowances"].first["id"]).to eq allowance.id
		end
	end

	context 'filtering on ids' do
		let!(:other_allowance) { create :allowance }

		it "filters allowances on id" do
			getWithAuth "#{url}.json", ids: [other_allowance.id]

			expect(last_response.status).to eq 200

			allowances = JSON.parse(last_response.body)

			expect(allowances["allowances"].first["id"]).to eq other_allowance.id
			expect(allowances["allowances"].size).to eq 1
		end
	end

	context 'show' do
		it "shows a allowance" do
			getWithAuth "#{url}/#{allowance.id}.json"

			expect(last_response.status).to eq 200

			result = JSON.parse(last_response.body)

			expect(result["allowance"]["id"]).to eq allowance.id
		end
	end
end
