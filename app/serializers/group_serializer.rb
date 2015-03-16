class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id

  #has_one :parent
  has_many :children
  has_many :users
end
