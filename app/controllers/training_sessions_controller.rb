class TrainingSessionsController < ApplicationController

  before_filter :authenticate_user!

	def index
		@training_sessions = current_user.training_sessions
	end

  def show
    @training_session = current_user.training_sessions.find params[:id]

    @users_who_did_not_answer = @training_session.invitations.has_not_answered.joins(:user).pluck(:phone)

    @users_who_confirmed = @training_session.invitations.coming.joins(:user).pluck(:phone)

    @all_users = @training_session.users.pluck(:phone)
  end

end