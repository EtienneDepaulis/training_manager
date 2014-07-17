class Group < ActiveRecord::Base
  belongs_to :parent, class_name: "Group"
  has_many :children, class_name: "Group", foreign_key: "parent_id"

  validates_presence_of :name
end
