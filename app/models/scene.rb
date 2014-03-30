class Scene < ActiveRecord::Base
	belongs_to :book
	belongs_to :user
	acts_as_taggable
end
