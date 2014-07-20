class Invitation < ActiveRecord::Base

	AVAILABLE_STATUS = ["pending", "confirmed", "declined"]

  belongs_to :user
  belongs_to :training_session

  validates_presence_of :user, :training_session
  validates_inclusion_of :status, in: AVAILABLE_STATUS
end
