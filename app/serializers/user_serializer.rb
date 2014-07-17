class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :group
end
