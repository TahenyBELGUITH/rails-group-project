require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food should have valid attributes' do
    user = User.create(id: 1,name: 'Name',email: 'ex@gm.com',password: '000000')
    food = Food.create(name: 'f_name', measurement_unit: 'kg', quantity: 30, price: 10, user_id:1)

    it 'should be valid with valid input fields' do
      expect(food).to be_valid
    end

    it ' should not be valid without name' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it ' should not be valid without measurement unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it ' should not be valid without quantity' do
      food.quantity = nil
      expect(food).to_not be_valid
    end

    it ' should not be valid without price' do
      food.price = nil
      expect(food).to_not be_valid
    end

    it ' Price should be integer' do
      food.price = 'a'
      expect(food).to_not be_valid
    end
  end
end
