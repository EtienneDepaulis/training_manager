class GroupSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :name

  # has_one :parent, serializer: ParentSerializer
  # has_many :children
end
