class TrainingSession < ActiveRecord::Base

	include Filterable

  belongs_to :location

  has_many :allowances, dependent: :destroy, inverse_of: :training_session
  has_many :groups, through: :allowances
  accepts_nested_attributes_for :allowances, allow_destroy: true

	has_many :invitations, dependent: :destroy
  has_many :users, through: :invitations

  validates_presence_of :location, :started_at

  def is_expected_counter
  	invitations.coming.count
  end

  def is_not_expected_counter
  	invitations.not_coming.count
  end

  def has_not_answered_counter
  	invitations.has_not_answered.count
  end

end
