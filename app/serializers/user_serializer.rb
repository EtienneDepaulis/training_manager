class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :token, :is_admin, :group_id

  # has_one :group
  has_many :invitations
  has_many :training_sessions
end
