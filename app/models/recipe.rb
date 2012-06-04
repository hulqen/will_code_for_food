class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :name, :servings

  has_many :instructions, :dependent => :destroy

  validates_presence_of :name, :servings

end
