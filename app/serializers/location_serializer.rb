class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :training_sessions
end
