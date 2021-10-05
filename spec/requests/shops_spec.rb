# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  describe 'GET /order' do
    it 'returns http success' do
      get '/shops/order'
      expect(response).to have_http_status(:success)
    end
  end
end