class Allowance < ActiveRecord::Base
  belongs_to :group
  belongs_to :training_session, inverse_of: :allowances

  validates_presence_of :group, :training_session
end
