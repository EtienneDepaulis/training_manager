class Invitation < ActiveRecord::Base

	AVAILABLE_STATUS = ["pending", "confirmed", "declined"]

  belongs_to :user
  belongs_to :training_session

  validates_presence_of :user, :training_session
  validates_inclusion_of :status, in: AVAILABLE_STATUS

  after_initialize :set_default_status

  private
  	def set_default_status
  		self.status = status || AVAILABLE_STATUS.first
  	end
end
