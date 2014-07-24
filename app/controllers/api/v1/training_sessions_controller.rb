class Api::V1::TrainingSessionsController < Api::V1::BaseController

	before_filter :authenticate_user!

	def index
		respond_with TrainingSession.all
	end

	def create
		@training_session = TrainingSession.new(training_session_params)
		if @training_session.save
			respond_with :api, :v1, @training_session
		else
			render json: { errors: @training_session.errors.messages }, status: 422
		end
	end

	def show
		respond_with training_session
	end

	def update
		if training_session.update(training_session_params)
      respond_with @training_session
    else
      render json: { errors: @training_session.errors.messages }, status: 422
    end
  end

  def destroy
  	training_session.destroy
    head 204
  end

	private
		def training_session
			@training_session = TrainingSession.find(params[:id])
		end

		def training_session_params
    	params.require(:training_session).permit(:description, :started_at, :location_id)
  	end
end