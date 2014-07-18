class Group < ActiveRecord::Base
  belongs_to :parent, class_name: "Group"
  has_many :children, class_name: "Group", foreign_key: "parent_id"
  has_many :users

  validates_presence_of :name
end
