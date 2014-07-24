class UserShortSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :email, :group_id
end
