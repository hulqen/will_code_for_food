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

  def update
    @recipe = Recipe.update(params[:recipe])
    @recipe.save
  end
end
