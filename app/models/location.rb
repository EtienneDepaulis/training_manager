class Location < ActiveRecord::Base
	has_many :training_sessions

	validates_presence_of :name
end
