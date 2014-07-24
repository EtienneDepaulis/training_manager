class User < ActiveRecord::Base
	belongs_to :group

	has_many :invitations, dependent: :destroy
  has_many :training_sessions, through: :invitations

	validates_presence_of :name, :group

	before_create :set_token

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
