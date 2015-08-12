class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :group

  validates_presence_of :group, :user
  validates_uniqueness_of :user, scope: :group
end
