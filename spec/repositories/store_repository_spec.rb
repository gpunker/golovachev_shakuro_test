# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShopService' do
  context 'working with stores' do
    it 'find store in a shop by a specific book for order' do
      shop = Shop.create!(name: 'amazon')
      publisher = Publisher.create(name: 'O-Reilly')
      book = Book.create!(title: 'War and Piece', publisher: publisher)
      Store.create(amount: 10, shop: shop, book: book)

      result = StoreRepository.get_store_by_shop_id_and_book_id_for_order(shop.id, book.id)

      expect(result.is_a?(Store)).to eq true
    end
  end
end
