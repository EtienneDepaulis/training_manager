class TrainingSession < ActiveRecord::Base
  belongs_to :location

  has_many :allowances, dependent: :destroy, inverse_of: :training_session
  has_many :groups, through: :allowances
  accepts_nested_attributes_for :allowances, allow_destroy: true

	has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates_presence_of :location, :started_at
end
