class Invitation < ActiveRecord::Base

  include Filterable

  belongs_to :user
  belongs_to :training_session

  validates_presence_of :user, :training_session

  scope :for_user, ->(user) { where(user: user) }

  after_initialize :set_default_values
  after_save :notify_answer

  private
  	def set_default_values
  		self.is_confirmed   = is_confirmed  || false
      self.is_answered    = is_answered   || false
  	end

    def notify_answer
      return if is_answered?
      return unless is_confirmed_changed?

      self.update_attribute(:is_answered, true)
    end
end
