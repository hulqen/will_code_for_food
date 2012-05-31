class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :name, :servings
  validates_presence_of :name, :servings
end
