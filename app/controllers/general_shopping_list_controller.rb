class GeneralShoppingListController < ApplicationController
  def index
    @foods = current_user.foods
    @sum = 0
    @items = 0
    @foods.each do |food|
      quantity = RecipeFood.joins(:food).where(food_id: food.id).sum('quantity')
      food_quantity = @foods.where(id: food.id).sum('quantity')
      quantity_to_buy = quantity - food_quantity

      if quantity_to_buy.positive?
        @items += 1
        @sum += food.price * quantity_to_buy
      end

      #  @sum += RecipeFood.joins(:food).where(food_id: food.id).sum('quantity') * food.price
      # @sum += RecipeFood.joins(:food).where(food_id: food.id).sum('quantity') * food.price
    end
    # @quantity_to_buy = @quantity - @food_quantity
  end
end
