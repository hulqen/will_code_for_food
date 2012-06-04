class Instruction < ActiveRecord::Base
  attr_accessible :recipe_id, :step, :text
  validates_presence_of :text, :recipe_id

  belongs_to :recipe

end
