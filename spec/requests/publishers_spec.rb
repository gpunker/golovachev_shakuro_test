# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publishers', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      Publisher.create!(name: 'O-Reilly')

      get '/api/publishers', as: :json
      
      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(body.is_a? Array).to eq true
      expect(body.count).to eq 1
      expect(body[0]['id'].nil?).to eq false
      expect(body[0]['name']).to eq 'O-Reilly'
      expect(body[0]['url']).to eq '/api/publishers/o-reilly'
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      mocked_data = {
          'Amazon' => [{
            'shop_id' => 1,
            'name' => 'Amazon',
            'total_sold' => 16,
            'book_id' => 1,
            'title' => 'The Spook Who Sat by the Door',
            'amount' => 0
          }]
        }

      expect(ShopService).to receive(:get_shops_with_books_by_publisher)
        .with('amazon')
        .and_return(mocked_data)
        .exactly(1).times

      get '/api/publishers/amazon', as: :json

      body = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(body.is_a? Hash).to eq true
      expect(body['shops'].is_a? Array).to eq true
      expect(body['shops'].is_a? Array).to eq true
      expect(body['shops'][0]['id']).to eq 1
      expect(body['shops'][0]['name']).to eq 'Amazon'
      expect(body['shops'][0]['books_sold_count']).to eq 16
      expect(body['shops'][0]['books_in_stock'].is_a? Array).to eq true
      expect(body['shops'][0]['books_in_stock'][0]['id']).to eq 1
      expect(body['shops'][0]['books_in_stock'][0]['title']).to eq 'The Spook Who Sat by the Door'
      expect(body['shops'][0]['books_in_stock'][0]['copies_in_stock']).to eq 0
    end
  end
end
