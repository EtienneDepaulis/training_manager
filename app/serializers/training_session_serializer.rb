class TrainingSessionSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :description, :started_at

  has_one :location
  has_many :groups, serializer: GroupShortSerializer
  has_many :allowances
end
