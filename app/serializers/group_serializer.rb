class GroupSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :name, :parent_id

  # has_one :parent, serializer: ParentSerializer
  # has_many :children

  has_many :users, serializer: UserShortSerializer
end
