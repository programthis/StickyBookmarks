class Book < ActiveRecord::Base
	belongs_to :user
	has_many :scenes
	acts_as_taggable
end
