class AllowanceSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id

  has_one :group
  has_one :training_session
end
