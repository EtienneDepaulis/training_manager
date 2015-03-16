class TrainingSessionSerializer < ActiveModel::Serializer
  attributes :id, :description, :started_at, :location_id, :is_expected_counter, :is_not_expected_counter, :has_not_answered_counter

  # has_one :location
  has_many :groups
  has_many :allowances
  has_many :invitations
end