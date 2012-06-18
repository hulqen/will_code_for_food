class SlProductRowController < ApplicationController
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.sl_product_rows.clear
    redirect_to shopping_list_url
  end
end
