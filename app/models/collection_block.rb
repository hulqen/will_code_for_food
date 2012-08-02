class CollectionBlock < ActiveRecord::Base
  attr_accessible :name, :position, :recipe_collection_id, :block_contents_attributes
  belongs_to :recipe_collection
  has_many :block_contents

  accepts_nested_attributes_for :block_contents, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true


  def add_recipe(recipe, preferred_servings)
    block_contents.create!(:recipe_id => recipe.id, :preferred_servings => preferred_servings)
  end
end
