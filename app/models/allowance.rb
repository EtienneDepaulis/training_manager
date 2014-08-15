class Allowance < ActiveRecord::Base

  include Filterable

  belongs_to :group
  belongs_to :training_session, inverse_of: :allowances

  validates_presence_of :group, :training_session
  validates_uniqueness_of :training_session, scope: :group

  after_create :create_invitations
  after_destroy :destroy_invitations

  private
  	def create_invitations
      group.users.each do |user|
        training_session.invitations.create(user: user)
      end
  	end

  	def destroy_invitations
  		Invitation.where(training_session: training_session, user: group.users).destroy_all
  	end
end
