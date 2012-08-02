class BasketsController < ApplicationController

  def create
    if params[:custom == true]
      product = Product.find_by_name(params[:product_name])
      current_user.shopping_list.sl_product_rows.update_all({:in_basket => true}, {:product_id => product.id})
    else
      custom_product = CustomProduct.find(params[:id])
      current_user.shopping_list.sl_custom_rows.update_all({:in_basket => true}, {:custom_product_id => custom_product.id})
    end
    redirect_to shopping_list_url
  end

  def destroy
    product = Product.find_by_name(params[:product_name])
    current_user.shopping_list.sl_product_rows.update_all({:in_basket => false}, {:product_id => product.id})

    redirect_to shopping_list_url
  end
end