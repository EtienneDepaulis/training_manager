class UserSerializer < ActiveModel::Serializer
  attributes :name, :phone, :email
end
