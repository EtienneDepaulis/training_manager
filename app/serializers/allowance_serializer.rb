class AllowanceSerializer < ActiveModel::Serializer
  attributes :id, :group_id, :training_session_id

  # has_one :group
  # has_one :training_session
end
