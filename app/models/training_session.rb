class TrainingSession < ActiveRecord::Base
  belongs_to :location

  has_many :allowances, dependent: :destroy
  has_many :groups, through: :allowances

	has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates_presence_of :location, :started_at
end
