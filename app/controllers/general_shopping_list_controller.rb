class GeneralShoppingListController < ApplicationController
  def index
    @foods = current_user.foods
    @sum = 0
    @foods.each do |food|
      @sum += RecipeFood.joins(:food).where(food_id: food.id).sum('quantity') * food.price
    end
  end
end
