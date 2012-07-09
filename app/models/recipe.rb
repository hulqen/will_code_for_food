class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :name, :servings, :instructions_attributes, :ingredients_attributes
  has_many :instructions, :order => 'step', :dependent => :destroy
  has_many :ingredients, :dependent => :destroy
  has_many :sl_product_rows, :dependent => :destroy

  accepts_nested_attributes_for :instructions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => :true
  accepts_nested_attributes_for :ingredients,  :reject_if => lambda { |a| a[:product_name].blank? }, :allow_destroy => :true

  validates_presence_of :name, :servings, :cook_time
  validates_uniqueness_of :name

end
