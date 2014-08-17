class Group < ActiveRecord::Base

	include Filterable

  belongs_to :parent, class_name: "Group"
  has_many :children, class_name: "Group", foreign_key: "parent_id"
  has_many :users

  has_many :allowances, dependent: :destroy
  has_many :training_sessions, through: :allowances

  validates_presence_of :name
  validate :parent_validation

  scope :top_level_only, ->{ where(parent_id: nil) }

  private

 		def parent_validation
 			return if parent.nil?

 			errors.add(:parent, "L'équipe parente ne peut être elle même.") if self == parent
 		end
end
