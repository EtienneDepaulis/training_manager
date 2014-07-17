class Api::V1::UsersController < Api::V1::BaseController

	def index
		respond_with User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			respond_with :api, :v1, User.create(user_params)
		else
			render json: { errors: @user.errors.messages }, status: 422
		end
	end

	def show
		respond_with user
	end

	def update
		if user.update(user_params)
      respond_with @user
    else
      render json: { errors: @user.errors.messages }, status: 422
    end
  end

  def destroy
  	user.destroy
    head 204
  end

	private
		def user
			@user = User.find(params[:id])
		end

		def user_params
    	params.require(:user).permit(:name, :email, :phone, :group_id)
  	end
end