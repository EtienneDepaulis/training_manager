class Admin::TrainingSessionsController  < Admin::ApplicationController

  before_action :set_training_session, only: [:edit, :update, :destroy]

  def index
    @training_sessions = TrainingSession.all.order("started_at ASC")
  end

  def new
    @training_session = TrainingSession.new started_at: Time.now
  end

  def create
    @training_session = TrainingSession.new(training_session_params)

    if @training_session.save
      redirect_to admin_training_sessions_path, notice: 'Entrainement crée.'
    else
      render action: 'new'
    end

  end

  def edit
  end

  def update
    if @training_session.update(training_session_params)
      redirect_to admin_training_sessions_path, notice: 'Entrainement modifié.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @training_session.destroy
    redirect_to admin_training_sessions_path
  end

  private
    def set_training_session
      @training_session = TrainingSession.find(params[:id])
    end

    def training_session_params
      params.require(:training_session).permit(:description, :started_at, :location_id, group_ids: [])
    end
end
