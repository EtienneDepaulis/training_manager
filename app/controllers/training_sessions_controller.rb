class TrainingSessionsController < ApplicationController

  before_filter :authenticate_user!

	def index
		@training_sessions = current_user.training_sessions
	end

  def show
    @training_session = current_user.training_sessions.find params[:id]
  end

end