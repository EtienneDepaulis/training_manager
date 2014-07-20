class TrainingSession < ActiveRecord::Base
  belongs_to :location

  validates_presence_of :location, :started_at
end
