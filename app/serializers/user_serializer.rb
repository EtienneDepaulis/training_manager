class UserSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :name, :phone, :email, :token

  has_one :group
end
