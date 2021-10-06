# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShopRepository' do
  context 'working with shops in db' do
    it 'find shops with books by specific publisher' do
      shop = Shop.create!(name: 'amazon')
      publisher = Publisher.create!(name: 'O-Reilly', slug: 'o-reilly')
      book = Book.create!(title: 'War and Piece', publisher: publisher)
      Store.create!(amount: 10, shop: shop, book: book)

      result = ShopRepository.get_shops_with_books_by_publisher('o-reilly')

      expect(result.is_a?(Array)).to eq true
      expect(result[0].is_a?(Hash)).to eq true
      expect(result[0]['shop_id'].nil?).to eq false
      expect(result[0]['shop_id'].is_a?(Integer)).to eq true
      expect(result[0]['name'].nil?).to eq false
      expect(result[0]['name'].is_a?(String)).to eq true
      expect(result[0]['total_sold'].nil?).to eq false
      expect(result[0]['total_sold'].is_a?(Integer)).to eq true
      expect(result[0]['title'].nil?).to eq false
      expect(result[0]['title'].is_a?(String)).to eq true
      expect(result[0]['amount'].nil?).to eq false
      expect(result[0]['amount'].is_a?(Integer)).to eq true
    end

    it 'find shop for order correctly' do
      shop = Shop.create(name: 'amazon')
      result = ShopRepository.get_shop_for_order(shop.id)

      expect(result.is_a?(Shop)).to eq true
    end

    it 'raise an error when find shop for order' do
      expect { ShopRepository.get_shop_for_order(0) }.to raise_error(StandardError)
    end

    it 'find book in shop' do
      shop = Shop.create!(name: 'amazon')
      publisher = Publisher.create!(name: 'O-Reilly', slug: 'o-reilly')
      book = Book.create!(title: 'War and Piece', publisher: publisher)
      Store.create!(amount: 10, shop: shop, book: book)

      result = ShopRepository.get_book_of_shop_by_id(shop, book.id)

      expect(result.is_a?(Book)).to eq true
    end

    it 'nil when shop has not a specific book ' do
      shop = Shop.create!(name: 'amazon')
      # publisher = Publisher.create!(name: 'O-Reilly', slug: 'o-reilly')
      # book = Book.create!(title: 'War and Piece', publisher: publisher)
      # Store.create(amount: 10, shop: shop, book: book)

      result = ShopRepository.get_book_of_shop_by_id(shop, 0)

      expect(result.nil?).to eq true
    end

    it 'create an order correctly' do
      shop = Shop.create!(name: 'amazon')
      publisher = Publisher.create!(name: 'O-Reilly', slug: 'o-reilly')
      book = Book.create!(title: 'War and Piece', publisher: publisher)
      Store.create!(amount: 10, shop: shop, book: book)

      order = ShopRepository.make_order(shop, book, 1)

      expect(order.is_a?(Order)).to eq true
      expect(order.amount).to eq 1
    end

    it 'create an order but there are not enough books' do
      shop = Shop.create!(name: 'amazon')
      publisher = Publisher.create!(name: 'O-Reilly', slug: 'o-reilly')
      book = Book.create!(title: 'War and Piece', publisher: publisher)
      Store.create!(amount: 0, shop: shop, book: book)

      expect { ShopRepository.make_order(shop, book, 1) }.to raise_error(StandardError)
    end
  end
end
