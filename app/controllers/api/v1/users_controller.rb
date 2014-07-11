class Api::V1::UsersController < Api::V1::BaseController

	def index
		respond_with User.all
	end

	def show
		respond_with user
	end

	def update
    respond_with user.update(user_params)
  end

  def destroy
  	user.destroy
    head 204
  end

	private
		def user
			User.find(params[:id])
		end

		def user_params
    	params.require(:user).permit(:name, :email, :phone)
  	end
end