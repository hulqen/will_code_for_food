class BlockContent < ActiveRecord::Base
  attr_accessible :collection_block_id, :comment, :position, :preferred_servings, :recipe_id
  belongs_to :recipe
  belongs_to :collection_block

  delegate :name, :to => :recipe, :prefix => true, :allow_nil => true

end
