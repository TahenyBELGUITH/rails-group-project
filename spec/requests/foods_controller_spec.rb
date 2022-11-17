require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  context 'GET /index' do
    before(:each) do
      get '/foods'
    end
    it 'Foods index is successful' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders correct template' do
      expect(response).to render_template(:index)
    end
    it 'Does not render wrong template' do
      expect(response).to_not render_template(:show)
    end
    it 'Response body includes correct placeholder text' do
      expect(response.body).to include('LIST OF FOODS')
    end
  end
end
