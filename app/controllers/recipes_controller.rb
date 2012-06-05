# encoding: utf-8
class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.instructions.build }
  end

  def create
    @recipe = Recipe.create(params[:recipe])
    if @recipe.save
      redirect_to root_url, :notice => "Receptet \"" + @recipe.name + "\" sparat!"
    else
      flash.now.alert = "Du glömde fylla i något! Se nedan:"
      render "new"
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to root_url, :notice => "Receptet \"" + @recipe.name + "\" uppdaterat!"
    else
      flash.now.alert = "Du glömde fylla i något! Se nedan:"
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    deleted_recipe_name = @recipe.name
    @recipe.destroy

    redirect_to root_url, :notice => "Receptet \"" + deleted_recipe_name + "\" borttaget!"
  end
end
