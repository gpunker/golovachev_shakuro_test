# frozen_string_literal: true

# Shops service class
class ShopService
  class << self
    # Get shops with books from repository by publisher's slug and group it by shop's name.
    # Returns books only by specific publisher.
    #
    #   get_shops_with_books_by_publisher('amazon')
    #
    # @param slug [String] slug of shop
    # @return [Hash] hash with hashes of shops and books
    def get_shops_with_books_by_publisher(slug)
      ShopRepository.get_shops_with_books_by_publisher(slug).group_by { |i| i['name'] }
    end

    # Makes order of book for specific book and shop
    #
    # @param shop_id [Integer] ID of shop
    # @param book_id [Integer] ID of book
    # @param amount [Integer] Count of books for order
    # @return [Array] Array of objects: Shop, Book, Order
    # @raise [StandardError]
    def make_order(shop_id, book_id, amount)
      shop = ShopRepository.get_shop_for_order(shop_id)
      book = ShopRepository.get_book_of_shop_by_id(shop, book_id)
      raise StandardError, 'Book not found' unless book

      order = ShopRepository.make_order(shop, book, amount)

      [shop, book, order]
    end
  end
end
