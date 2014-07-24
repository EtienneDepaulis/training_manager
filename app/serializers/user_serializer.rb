class UserSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :name, :phone, :email

  has_one :group, serializer: GroupShortSerializer
end
