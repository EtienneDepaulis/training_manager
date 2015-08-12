class User < ActiveRecord::Base

	include Filterable

	has_many :memberships, dependent: :destroy
	has_many :groups, through: :memberships

	has_many :invitations, dependent: :destroy
  has_many :training_sessions, through: :invitations

	validates_presence_of :name

	before_create :set_token
	after_save :update_invitations

	def to_s
		name
	end

	def phone_formated
  	return '' if phone.blank?

		phone.gsub(/\s/, '')
  end

  def update_invitations
		current_training_sessions = training_sessions.reload
		futur_training_sessions = TrainingSession.for_groups(groups)

		training_sessions_to_add = futur_training_sessions - current_training_sessions
		self.training_sessions << training_sessions_to_add

		training_sessions_to_remove = current_training_sessions - futur_training_sessions
		self.invitations.where(training_session: training_sessions_to_remove).destroy_all
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
end
