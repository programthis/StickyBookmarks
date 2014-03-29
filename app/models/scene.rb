class Scene < ActiveRecord::Base
	belongs_to :book

acts_as_taggable
end
