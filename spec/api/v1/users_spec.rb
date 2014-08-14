require 'rails_helper'

RSpec.describe '/api/v1/users', type: :api do

	let(:url) { "/api/v1/users" }
	let!(:user) { create :user, name: "Etienne" }

	context 'being authenticated' do
		context 'index' do
			it "lists users" do
				getWithAuth "#{url}.json"

				expect(last_response.status).to eq 200

				users = JSON.parse(last_response.body)

				expect(users["users"].first["name"]).to eq "Etienne"
			end

			context 'filtering on ids' do
				let!(:other_user) { create :user, name: "Marc" }

				it "filters users on id" do
					getWithAuth "#{url}.json", ids: [other_user.id]

					expect(last_response.status).to eq 200

					users = JSON.parse(last_response.body)

					expect(users["users"].first["name"]).to eq "Marc"
					expect(users["users"].size).to eq 1
				end
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
			let(:group) { create :group }

			it "creates a user" do
				postWithAuth "#{url}.json", user: { name: 'Stéphane', group_id: group.id }

				expect(last_response.status).to eq 201

				response = JSON.parse(last_response.body)

				expect(response["user"]["name"]).to eq "Stéphane"
			end

			it "creates only one user" do
				expect{
					postWithAuth "#{url}.json", user: { name: 'Stéphane', group_id: group.id }
					}.to change(User, :count).by(1)
			end

			it "raises an error" do
				postWithAuth "#{url}.json", user: { name: '' }

				expect(last_response.status).to eq 422

				response = JSON.parse(last_response.body)

				expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

			end
		end

		context 'update' do
			let(:group) { create :group }

			it "updates a user" do
				patchWithAuth "#{url}/#{user.id}.json", user: { name: 'Stéphane' }

				expect(last_response.status).to eq 204

				expect(user.reload.name).to eq "Stéphane"
			end

			it "updates a user's group" do
				patchWithAuth "#{url}/#{user.id}.json", user: { group_id: group.id }

				expect(last_response.status).to eq 204

				expect(user.reload.group).to eq group
			end

			it "raises an error" do
				patchWithAuth "#{url}/#{user.id}.json", user: { name: '' }

				expect(last_response.status).to eq 422

				response = JSON.parse(last_response.body)

				expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
			end
		end

		context 'destroy' do
			it "destroys a user" do
				deleteWithAuth "#{url}/#{user.id}.json"

				expect(last_response.status).to eq 204
			end
		end
	end

	context 'not being authenticated' do
		context 'index' do
			it "renders a 401" do
				get "#{url}.json"
				expect(last_response.status).to eq 401
			end
		end
	end


end
