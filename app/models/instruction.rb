class Instruction < ActiveRecord::Base
  attr_accessible :recipe_id, :step, :text
  validates_presence_of :text

  belongs_to :recipe
  acts_as_list :scope => :recipe, :column => :step
  default_scope :order => :step

end