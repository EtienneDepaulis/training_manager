class InvitationSerializer < ActiveModel::Serializer
	embed :ids

  attributes :id, :is_confirmed, :is_answered

  has_one :training_session
  has_one :user, include: true
end
