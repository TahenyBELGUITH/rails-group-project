class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @user = User.find(@recipe.user_id)
    @recipe.destroy
    @recipe.save
    flash[:notice] = 'recipe was successfully deleted'
    redirect_to user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :cooking_time, :preparation_time)
  end
end
