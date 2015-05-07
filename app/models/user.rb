class User < ActiveRecord::Base

	include Filterable

	belongs_to :group

	has_many :invitations, dependent: :destroy
  has_many :training_sessions, through: :invitations

	validates_presence_of :name, :group

	before_create :set_token
	after_save :manage_invitations

	def to_s
		name
	end

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

			training_sessions_to_add = futur_training_sessions - current_training_sessions
			self.training_sessions << training_sessions_to_add

			training_sessions_to_remove = current_training_sessions - futur_training_sessions
			self.invitations.where(training_session: training_sessions_to_remove).destroy_all
		end
end
