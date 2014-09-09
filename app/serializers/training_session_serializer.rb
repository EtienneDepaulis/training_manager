class TrainingSessionSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :description, :started_at, :is_expected_counter, :is_not_expected_counter, :has_not_answered_counter

  has_one :location, include: true
  has_many :groups, include: true
  has_many :allowances, include: true
  has_many :invitations, include: true
end