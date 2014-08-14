class TrainingSessionSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :description, :started_at

  has_one :location
  has_many :groups
  has_many :allowances
end
