class GroupSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :name, :parent_id, :child_ids

  # has_one :parent, serializer: ParentSerializer
  #has_many :children, serializer: GroupShortSerializer
  has_many :users, serializer: UserShortSerializer
end
