class TrainingSession < ActiveRecord::Base
  belongs_to :location
  has_many :allowances
  has_many :groups, through: :allowances

  validates_presence_of :location, :started_at
end
