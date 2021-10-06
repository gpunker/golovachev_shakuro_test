# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShopService' do
  context 'working with shops' do
    it 'gets shops with books by a specific publisher' do
      mocked_data = [
        {
          'shop_id' => 1,
          'name' => 'Amazon',
          'total_sold' => 16,
          'book_id' => 1,
          'title' => 'The Spook Who Sat by the Door',
          'amount' => 0
        }
      ]

      expect(ShopRepository).to receive(:get_shops_with_books_by_publisher)
        .with('test')
        .and_return(mocked_data)
        .exactly(1).times

      res = ShopService.get_shops_with_books_by_publisher('test')

      expected_data = {
        'Amazon' => [{
          'shop_id' => 1,
          'name' => 'Amazon',
          'total_sold' => 16,
          'book_id' => 1,
          'title' => 'The Spook Who Sat by the Door',
          'amount' => 0
        }]
      }

      expect(res).to eq(expected_data)
    end
  end

  context 'working with objects' do
    it 'make an order correctly' do
      shop = Shop.new
      book = Book.new
      expect(ShopRepository).to receive(:get_shop_for_order)
        .with(1)
        .and_return(shop)
        .exactly(1).times

      expect(ShopRepository).to receive(:get_book_of_shop_by_id)
        .with(shop, 1)
        .and_return(book)
        .exactly(1).times

      expect(ShopRepository).to receive(:make_order)
        .with(shop, book, 1)
        .and_return(Order.new)
        .exactly(1).times

      result = ShopService.make_order(1, 1, 1)
      expect(result.is_a?(Array)).to eq true
      expect(result[0].is_a?(Shop)).to eq true
      expect(result[1].is_a?(Book)).to eq true
      expect(result[2].is_a?(Order)).to eq true
    end

    it 'make an order but there are no book' do
      shop = Shop.new
      expect(ShopRepository).to receive(:get_shop_for_order)
        .with(1)
        .and_return(shop)
        .exactly(1).times

      expect(ShopRepository).to receive(:get_book_of_shop_by_id)
        .with(shop, 1)
        .and_return(nil)
        .exactly(1).times

      expect { ShopService.make_order(1, 1, 1) }.to raise_error(StandardError)
    end
  end
end
