class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.includes(:user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if Food.destroy(params[:id])
      redirect_to foods_path
      flash[:success] = 'The food was successfully deleted.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
