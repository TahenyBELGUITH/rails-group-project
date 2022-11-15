class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id)
    @recipe.destroy
    @recipe.save
    flash[:notice] = 'recipe was successfully deleted'
    redirect_to user_recipes_path
  end
end
