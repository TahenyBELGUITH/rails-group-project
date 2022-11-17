require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:each) do
    @user = User.create(name: 'Username')
    @food = Food.create(name: 'f_name', measurement_unit: 'kg', quantity: 30, price: 10, user: @user)
  end

  describe 'index page' do
    before(:each) do
      visit '/foods'
    end

    it 'I can see the foods name ' do
      expect(page).to have_content 'Name'
    end
    it 'I can see the foods quantity' do
      expect(page).to have_content 'Quantity'
    end
    it 'I can see the food measurement unit' do
      expect(page).to have_content 'Measurement Unit'
    end
    it 'I can see the food price' do
      expect(page).to have_content 'Price'
    end
  end
end
