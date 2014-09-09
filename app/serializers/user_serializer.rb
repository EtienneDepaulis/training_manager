class UserSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :name, :phone, :email, :token, :is_admin

  has_one :group
  has_many :invitations, include: true
  has_many :training_sessions, include: true
end
