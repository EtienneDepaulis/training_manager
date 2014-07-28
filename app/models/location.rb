class Location < ActiveRecord::Base
	has_many :training_sessions, dependent: :destroy

	validates_presence_of :name
end
