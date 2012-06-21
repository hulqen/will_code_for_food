class CollectionBlock < ActiveRecord::Base
  attr_accessible :name, :position, :recipe_collection_id
  belongs_to :recipe_collection
  has_many :block_contents

  def add_recipe(recipe)
    block_contents.create!(:recipe_id => recipe.id)
  end
end
