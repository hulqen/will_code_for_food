class Recipe < ActiveRecord::Base
  attr_accessible :cook_time, :name, :servings, :instructions_attributes
  has_many :instructions, :order => 'step', :dependent => :destroy
  accepts_nested_attributes_for :instructions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => :true

  validates_presence_of :name, :servings

end
