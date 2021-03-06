class CollectionBlocksController < ApplicationController
  def show
  end

  def edit
    @recipe_collections = RecipeCollection.find_all_by_user_id(current_user.id)
    @recipe = Recipe.find(params[:id])
    @preferred_servings = params[:preferred_servings]
  end

  def update
    @collection_block = CollectionBlock.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @preferred_servings = params[:preferred_servings]
    @collection_block.add_recipe(@recipe, @preferred_servings)

    @recipe_collection = RecipeCollection.find(@collection_block.recipe_collection_id)
    redirect_to recipe_collection_path(@recipe_collection)
  end

  def destroy
  end
end