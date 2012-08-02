# encoding: utf-8
class ShoppingListsController < ApplicationController

  def add_recipe
    @recipe = Recipe.find(params[:id])
    @preferred_servings = params[:preferred_servings]
    if current_user.shopping_list.add_recipe(@recipe, @preferred_servings)
      flash[:notice] = "Receptet \"#{@recipe.name}\" är tillagt i din inköpslista!"
      redirect_to shopping_list_url
    else
      return nil
    end
  end

  def show
    @shopping_list = current_user.shopping_list
    @shopping_list.sl_custom_rows.build
  end

  def edit
    @shopping_list = current_user.shopping_list
  end

  def update
    @shopping_list = current_user.shopping_list
    @shopping_list.update_attributes(params[:shopping_list])
    redirect_to shopping_list_url
  end

  def destroy
    @shopping_list = current_user.shopping_list
    @shopping_list.sl_product_rows.clear
    @shopping_list.sl_custom_rows.clear

    redirect_to shopping_list_url
  end

end
