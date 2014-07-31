class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :training_session_ids
end
