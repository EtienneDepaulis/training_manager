class InvitationSerializer < ActiveModel::Serializer
	embed :ids, include: true

  attributes :id, :user_id, :status

  has_one :training_session, serializer: TrainingSessionShortSerializer
end
