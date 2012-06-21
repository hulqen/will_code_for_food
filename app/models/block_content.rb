class BlockContent < ActiveRecord::Base
  attr_accessible :collection_block_id, :comment, :position, :preferred_servings, :recipe_id
  belongs_to :recipe
end
