class SlProductRowsController < ApplicationController
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.sl_product_rows.clear
    redirect_to shopping_list_url
  end

  def shop
    product = Product.find_by_name(params[:product_name])
    current_user.shopping_list.sl_product_rows.update_all({:in_basket => true}, {:product_id => product.id})

    redirect_to shopping_list_url
  end

  def unshop
    product = Product.find_by_name(params[:product_name])
    current_user.shopping_list.sl_product_rows.update_all({:in_basket => false}, {:product_id => product.id})

    redirect_to shopping_list_url
  end

end
