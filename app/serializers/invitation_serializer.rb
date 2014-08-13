class InvitationSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :user_id, :is_confirmed, :is_answered

  has_one :training_session, serializer: TrainingSessionShortSerializer
end
