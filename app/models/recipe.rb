class Recipe < ActiveRecord::Base  
	validates_presence_of :title ,:method
	belongs_to :user 
	has_and_belongs_to_many :ingredients
end 