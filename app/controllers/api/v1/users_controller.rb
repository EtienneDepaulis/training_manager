class Api::V1::UsersController < Api::V1::BaseController

	def index
		respond_with User.all
	end

	def show
		respond_with user
	end

	private
		def user
			User.find(params[:id])
		end
end