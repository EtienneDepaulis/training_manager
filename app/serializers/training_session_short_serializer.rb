class TrainingSessionShortSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :description, :started_at

  has_one :location
end
