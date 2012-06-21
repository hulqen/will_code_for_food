# encoding: utf-8
class ShoppingListsController < ApplicationController

  def update
    @recipe = Recipe.find(params[:id])
    if current_user.shopping_list.add_recipe(@recipe)
      flash[:notice] = 'Receptet är tillagt i din inköpslista!'
      redirect_to shopping_list_url
    else
      return nil
    end
  end

  def show
    @shopping_list = current_user.shopping_list
  end

  def destroy
    @shopping_list = current_user.shopping_list
    @shopping_list.sl_product_rows.clear

    redirect_to shopping_list_url
  end
end
