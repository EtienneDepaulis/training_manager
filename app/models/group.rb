class Group < ActiveRecord::Base
  belongs_to :parent, class_name: "Group"
  has_many :children, class_name: "Group", foreign_key: "parent_id"
  has_many :users

  has_many :allowances
  has_many :training_sessions, through: :allowances

  validates_presence_of :name
end
