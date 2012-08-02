class SlCustomRowsController < ApplicationController
  def shop
    custom_product = CustomProduct.find(params[:id])
    current_user.shopping_list.sl_custom_rows.update_all({:in_basket => true}, {:custom_product_id => custom_product.id})

    redirect_to shopping_list_url
  end

  def unshop
    custom_product = CustomProduct.find(params[:id])
    current_user.shopping_list.sl_custom_rows.update_all({:in_basket => false}, {:custom_product_id => custom_product.id})

    redirect_to shopping_list_url
  end

end
