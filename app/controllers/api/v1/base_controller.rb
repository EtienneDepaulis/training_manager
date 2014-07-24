class NotAuthorizedError < StandardError ; end

class Api::V1::BaseController < ApplicationController
	respond_to :json

	rescue_from NotAuthorizedError, with: :user_not_authorized

	def authenticate_user!
		token = params[:token]

		raise NotAuthorizedError if token.blank? or !User.exists?(token: token)
	end

	def user_not_authorized
		render json: { errors: "No token provided." }, status: 401
	end
end