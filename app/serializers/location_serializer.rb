class LocationSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :name

  has_many :training_sessions, include: true
end
