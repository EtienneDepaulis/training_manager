class Api::V1::GroupsController < Api::V1::BaseController

	before_filter :authenticate_user!, except: [:index]
	before_filter :authenticate_admin!, only: [:create, :update, :destroy]

	def index
		respond_with Group.only_ids(params[:ids]).order("name ASC")
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			respond_with :api, :v1, @group
		else
			render json: { errors: @group.errors.messages }, status: 422
		end
	end

	def show
		respond_with group
	end

	def update
		if group.update(group_params)
      respond_with @group
    else
      render json: { errors: @group.errors.messages }, status: 422
    end
  end

  def destroy
  	group.destroy
    head 204
  end

	private
		def group
			@group = Group.find(params[:id])
		end

		def group_params
    	params.require(:group).permit(:name, :parent_id)
  	end
end