class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :is_confirmed, :is_answered, :updated_at, :created_at, :training_session_id, :user_id

  # has_one :training_session
  # has_one :user
end
