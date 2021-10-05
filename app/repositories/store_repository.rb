# frozen_string_literal: true

# Repository of stores
class StoreRepository
  class << self
    # Find shop's store for an order transaction
    #
    # @param shop_id [Integer] ID of shop
    # @param book_id [Integer] ID of book
    # @return [Store] Store instance
    # @return [nil] if store not found
    def get_store_by_shop_id_and_book_id_for_order(shop_id, book_id)
      Store.where(book_id: book_id, shop_id: shop_id).first.lock!
    end
  end
end
