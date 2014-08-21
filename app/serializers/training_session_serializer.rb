class TrainingSessionSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :description, :started_at, :is_expected_counter, :is_not_expected_counter, :has_not_answered_counter

  has_one :location
  has_many :groups
  has_many :allowances
  has_many :invitations, include: true
end