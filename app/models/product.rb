class Product < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :ingredients
  has_many :recipes, :through => :ingredients

end
