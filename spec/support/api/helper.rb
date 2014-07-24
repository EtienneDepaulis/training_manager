module ApiHelper
	include Rack::Test::Methods

	def app
		Rails.application
	end

  def getWithAuth(url, params = {})
  	get url, params, authorization_header(user)
  end

  def postWithAuth(url, params = {})
  	post url, params, authorization_header(user)
  end

  def patchWithAuth(url, params = {})
  	patch url, params, authorization_header(user)
  end

  def deleteWithAuth(url, params = {})
  	delete url, params, authorization_header(user)
  end

  def authorization_header(user)
  	{"HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Token.encode_credentials(user.token)}
  end
end

RSpec.configure do |c|
	c.include ApiHelper, type: :api
end