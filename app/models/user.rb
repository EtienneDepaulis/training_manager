class User < ActiveRecord::Base
	belongs_to :group

	has_many :invitations, dependent: :destroy
  has_many :training_sessions, through: :invitations

	validates_presence_of :name, :group
end
