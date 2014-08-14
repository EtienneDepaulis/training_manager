class Api::V1::AllowancesController < Api::V1::BaseController

	before_filter :authenticate_user!

	def index
		respond_with Allowance.only_ids(params[:ids])
	end

	def show
		respond_with allowance
	end

	private
		def allowance
			@allowance = Allowance.find(params[:id])
		end
end