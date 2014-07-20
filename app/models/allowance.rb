class Allowance < ActiveRecord::Base
  belongs_to :group
  belongs_to :training_session

  validates_presence_of :group, :training_session
end
