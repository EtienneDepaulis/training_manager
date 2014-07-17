class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_one :parent, serializer: ParentSerializer
  has_many :children
end
