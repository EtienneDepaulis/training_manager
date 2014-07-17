class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent, :children
end
