class RecipeCollectionsController < ApplicationController
  def index
    @recipe_collections = RecipeCollection.find_all_by_user_id(current_user.id)
  end

  def show
    @recipe_collection = RecipeCollection.find(params[:id])
  end

  def edit
    @recipe_collection = RecipeCollection.find(params[:id])
  end

  def new
    @recipe_collection = RecipeCollection.new
    3.times { @recipe_collection.collection_blocks.build }
  end

  def create
    # @recipe_collection = RecipeCollection.new(params[:recipe_collection])
    @recipe_collection = current_user.recipe_collections.new(params[:recipe_collection])
    if @recipe_collection.save
      redirect_to recipe_collection_path(@recipe_collection)
    else
      render :action => 'create'
    end
  end

  def update
    @recipe_collection = RecipeCollection.find(params[:id])

    if @recipe_collection.update_attributes(params[:recipe_collection])
      redirect_to recipe_collection_path(@recipe_collection)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @recipe_collection = RecipeCollection.find(params[:id])
    @recipe_collection.destroy
    redirect_to recipe_collections_path
  end

end
