class BlockContentsController < ApplicationController
  def update
    @block_content = BlockContent.find(params[:id])
    @recipe_collection = @block_content.collection_block.recipe_collection

    @block_content.update_attributes(:preferred_servings => params[:preferred_servings])
    redirect_to recipe_collection_path(@recipe_collection)
  end

end