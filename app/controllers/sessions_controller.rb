class SessionsController < ApplicationController


	def new
		@users = User.all
	end

  def create
    user = User.find params[:session][:user_id]
    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)

    redirect_to new_session_path
  end

end