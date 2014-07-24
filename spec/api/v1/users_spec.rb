require 'rails_helper'

RSpec.describe '/api/v1/users', type: :api do

	let(:url) { "/api/v1/users" }
	let!(:user) { create :user, name: "Etienne" }

	context 'index' do
		it "lists users" do
			get "#{url}.json", token: user.token

			expect(last_response.status).to eq 200

			users = JSON.parse(last_response.body)

			expect(users["users"].first["name"]).to eq "Etienne"
		end

		context 'filtering' do
			let(:group) { create :group }
			let!(:other_user) { create :user, name: "Marc", group: group }

			it "filters users on group_id" do
				get "#{url}.json", group_id: group.id, token: user.token

				expect(last_response.status).to eq 200

				users = JSON.parse(last_response.body)

				expect(users["users"].first["name"]).to eq "Marc"
				expect(users["users"].size).to eq 1
			end
		end
	end

	context 'being authenticated' do
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
				post "#{url}.json", user: { name: 'Stéphane', group_id: group.id }, token: user.token

				expect(last_response.status).to eq 201

				response = JSON.parse(last_response.body)

				expect(response["user"]["name"]).to eq "Stéphane"
			end

			it "creates only one user" do
				expect{
					post "#{url}.json", user: { name: 'Stéphane', group_id: group.id }, token: user.token
					}.to change(User, :count).by(1)
			end

			it "raises an error" do
				post "#{url}.json", user: { name: '' }, token: user.token

				expect(last_response.status).to eq 422

				response = JSON.parse(last_response.body)

				expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

			end
		end

		context 'update' do
			let(:group) { create :group }

			it "updates a user" do
				patch "#{url}/#{user.id}.json", user: { name: 'Stéphane' }, token: user.token

				expect(last_response.status).to eq 204

				expect(user.reload.name).to eq "Stéphane"
			end

			it "updates a user's group" do
				patch "#{url}/#{user.id}.json", user: { group_id: group.id }, token: user.token

				expect(last_response.status).to eq 204

				expect(user.reload.group).to eq group
			end

			it "raises an error" do
				patch "#{url}/#{user.id}.json", user: { name: '' }, token: user.token

				expect(last_response.status).to eq 422

				response = JSON.parse(last_response.body)

				expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
			end
		end

		context 'destroy' do
			it "destroys a user" do
				delete "#{url}/#{user.id}.json", token: user.token

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
