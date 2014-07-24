class Api::V1::LocationsController < Api::V1::BaseController

	before_filter :authenticate_user!

	def index
		respond_with Location.all
	end

	def create
		@location = Location.new(location_params)
		if @location.save
			respond_with :api, :v1, @location
		else
			render json: { errors: @location.errors.messages }, status: 422
		end
	end

	def show
		respond_with location
	end

	def update
		if location.update(location_params)
      respond_with @location
    else
      render json: { errors: @location.errors.messages }, status: 422
    end
  end

  def destroy
  	location.destroy
    head 204
  end

	private
		def location
			@location = Location.find(params[:id])
		end

		def location_params
    	params.require(:location).permit(:name)
  	end
end