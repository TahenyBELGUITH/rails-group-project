require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Name', email: 'a@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measurementUnit: 'kg', price: 4) }

  describe 'index page' do
    before(:each) do
      sign_in user
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
