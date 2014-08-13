class Api::V1::InvitationsController < Api::V1::BaseController

	before_filter :authenticate_user!

	def index
		respond_with Invitation.all
	end

	def show
		respond_with invitation
	end

	def update
		if invitation.update(invitation_params)
      respond_with @invitation
    else
      render json: { errors: @invitation.errors.messages }, status: 422
    end
  end

	private
		def invitation
			@invitation = Invitation.find(params[:id])
		end

		def invitation_params
    	params.require(:invitation).permit(:is_confirmed)
  	end
end