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

	def current_user
		@current_user
	end

	private
		def authenticate_token

    	authenticate_with_http_token do |token, options|
				@current_user = User.find_by(token: token)
			end
 		end
end