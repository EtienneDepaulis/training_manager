class TrainingSessionShortSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :description, :started_at

  has_one :location
end
