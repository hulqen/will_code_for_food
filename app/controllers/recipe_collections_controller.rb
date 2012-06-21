class RecipeCollectionsController < ApplicationController
  def index
      @recipe_collections = RecipeCollection.find_all_by_user_id(current_user.id)
  end

  def show
    # current_user_id = current_user.id
    @recipe_collection = RecipeCollection.find(params[:id])
  end

  def edit
    @recipe_collection = RecipeCollection.find(params[:id])
  end

  def create
    @recipe_collection = RecipeCollection.new(params[:recipe_collection])
  end

  def update
    @recipe_collection = RecipeCollection.find(params[:id])
  end

  def destroy
    @recipe_collection = RecipeCollection.find(params[:id])
    @recipe_collection.destroy
    redirect_to recipe_collections_path

  end
end
