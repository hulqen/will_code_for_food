class Product < ActiveRecord::Base
  attr_accessible :name
  validates_uniqueness_of :name
  has_many :ingredients
  has_many :recipes, :through => :ingredients
  has_many :sl_product_rows, :through => :shopping_lists
end
