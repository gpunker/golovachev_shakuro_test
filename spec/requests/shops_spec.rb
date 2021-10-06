# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  describe 'GET /order' do
    it 'returns http created' do
      params = {
        book_id: 1,
        amount: 1
      }

      expect(ShopService).to receive(:make_order)
        .with(1, 1, 1)
        .and_return([Shop.new(name: 'Amazon'), Book.new(title: 'How to live?'), Order.new(id: 1, amount: 1)])
        .exactly(1).times

      get '/api/shops/1/order', params: params, as: :json
      body = JSON.parse(response.body)

      expect(response).to have_http_status(:created)
      expect(body.is_a?(Hash)).to eq true
      expect(body['order_id']).to eq 1
      expect(body['shop']).to eq 'Amazon'
      expect(body['book']).to eq 'How to live?'
      expect(body['amount']).to eq 1
    end

    it 'returns http bad request because no books in store' do
      params = {
        book_id: 1,
        amount: 1
      }

      expect(ShopService).to receive(:make_order)
        .with(1, 1, 1)
        .and_raise(StandardError, 'Not enough books')

      get '/api/shops/1/order', params: params, as: :json
      body = JSON.parse(response.body)

      expect(response).to have_http_status(:bad_request)
      expect(body.is_a?(Hash)).to eq true
      expect(body['status']).to eq 400
      expect(body['title']).to eq 'Order error'
      expect(body['message']).to eq 'Not enough books'
    end
  end
end
