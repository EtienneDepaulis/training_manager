class UserSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :name, :phone, :email, :token, :is_admin

  has_one :group
end
