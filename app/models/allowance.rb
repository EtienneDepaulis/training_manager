class Allowance < ActiveRecord::Base
  belongs_to :group
  belongs_to :training_session, inverse_of: :allowances

  validates_presence_of :group, :training_session

  after_create :create_invitations
  after_destroy :destroy_invitations

  private
  	def create_invitations
  		training_session.users << group.users
  	end

  	def destroy_invitations
  		Invitation.where(training_session: training_session, user: group.users).destroy_all
  	end
end
