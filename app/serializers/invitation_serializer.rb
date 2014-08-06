class InvitationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :training_session_id, :status
end
