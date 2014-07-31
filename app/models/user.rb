class User < ActiveRecord::Base
	belongs_to :group

	has_many :invitations, dependent: :destroy
  has_many :training_sessions, through: :invitations

	validates_presence_of :name, :group

	before_create :set_token
	after_save :manage_invitations

	private
		def set_token
			return if token.present?
			self.token = generate_token
		end

		def generate_token
			loop do
		    random_token = SecureRandom.urlsafe_base64(nil, false)
		    break random_token unless self.class.exists?(token: random_token)
		  end
		end

		def manage_invitations
			return unless group_id_changed?

			current_training_sessions = training_sessions.reload
			futur_training_sessions = group.training_sessions

			(futur_training_sessions - current_training_sessions).each do |training_session|
				invitation = training_session.invitations.create(user: self, status: "pending")
			end

			(current_training_sessions - futur_training_sessions).each do |training_session|
				Invitation.where(training_session: training_session, user: self).destroy_all
			end
		end
end
