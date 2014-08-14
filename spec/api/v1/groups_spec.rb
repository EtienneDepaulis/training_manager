require 'rails_helper'

RSpec.describe '/api/v1/groups', type: :api do

	let(:url) { "/api/v1/groups" }
	let!(:group) { create :group, name: "N4" }
	let!(:user) { create :user, group: group }

	context 'index' do
		it "lists groups" do
			getWithAuth "#{url}.json"

			expect(last_response.status).to eq 200

			groups = JSON.parse(last_response.body)

			expect(groups["groups"].first["name"]).to eq "N4"
		end

		# it "restrict to top level group only" do
		# 	create :group, parent: group

		# 	getWithAuth "#{url}.json?top_level_only=true"

		# 	groups = JSON.parse(last_response.body)

		# 	puts groups

		# 	expect(groups["groups"].size).to eq 1
		# end
	end

	context 'filtering on ids' do
		let!(:other_group) { create :group }

		it "filters groups on id" do
			getWithAuth "#{url}.json", ids: [other_group.id]

			expect(last_response.status).to eq 200

			groups = JSON.parse(last_response.body)

			expect(groups["groups"].first["id"]).to eq other_group.id
			expect(groups["groups"].size).to eq 1
		end
	end

	context 'show' do
		it "shows a group" do
			getWithAuth "#{url}/#{group.id}.json"

			expect(last_response.status).to eq 200

			group = JSON.parse(last_response.body)

			expect(group["group"]["name"]).to eq "N4"
		end
	end

	context 'create' do
		let(:parent) { create :group, name: "N3" }

		it "creates a group" do
			postWithAuth "#{url}.json", group: { name: 'N3+', parent_id: parent.id }

			expect(last_response.status).to eq 201

			group = JSON.parse(last_response.body)

			expect(group["group"]["name"]).to eq "N3+"
			# expect(group["group"]["parent"]["name"]).to eq "N3"
		end

		it "raises an error" do
			postWithAuth "#{url}.json", group: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]

		end
	end

	context 'update' do
		it "updates a group" do
			patchWithAuth "#{url}/#{group.id}.json", group: { name: 'N4+' }

			expect(last_response.status).to eq 204

			expect(group.reload.name).to eq "N4+"
		end

		it "raises an error" do
			patchWithAuth "#{url}/#{group.id}.json", group: { name: '' }

			expect(last_response.status).to eq 422

			response = JSON.parse(last_response.body)

			expect(response["errors"]["name"]).to eq ["doit être rempli(e)"]
		end
	end

	context 'destroy' do
		it "destroys a group" do
			deleteWithAuth "#{url}/#{group.id}.json"

			expect(last_response.status).to eq 204
		end
	end
end
