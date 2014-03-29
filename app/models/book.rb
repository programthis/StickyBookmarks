class Book < ActiveRecord::Base
	belongs_to :User
	has_many :Scenes
end
