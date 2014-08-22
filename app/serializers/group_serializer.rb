class GroupSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :name

  has_one :parent
  has_many :children
  has_many :users, include: true
end
