class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user).where(public: true).order(:created_at)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
