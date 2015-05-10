class Admin::LocationsController  < Admin::ApplicationController

  before_action :set_location, only: [:edit, :update]

  def index
    @locations = Location.all.order("name ASC")
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to admin_locations_path, notice: 'Lieu créé.'
    else
      render action: 'new'
    end

  end

  def update
    if @location.update(location_params)
      redirect_to admin_locations_path, notice: 'Lieu modifié.'
    else
      render action: 'edit'
    end
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name)
    end
end
