class NotAuthorizedError < StandardError ; end

class Api::V1::BaseController < ApplicationController
	respond_to :json

	rescue_from NotAuthorizedError, with: :user_not_authorized

	def authenticate_user!
		 raise NotAuthorizedError unless authenticate_token
	end

	def user_not_authorized
		self.headers['WWW-Authenticate'] = 'Token realm="Application"'
		render json: { errors: "No token provided." }, status: 401
	end

	private
		def authenticate_token

    	authenticate_with_http_token do |token, options|
				User.exists?(token: token)
			end
 		end
end