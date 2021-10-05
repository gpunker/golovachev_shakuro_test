# frozen_string_literal: true

# Repository of shop model
class ShopRepository
  class << self
    # Get shops with books from DB by publisher's slug.
    # Returns books only by specific publisher.
    #
    #   get_shops_with_books_by_publisher('amazon')
    #
    # @param slug [String] slug of shop
    # @return [Array] array with hashes of shops and books
    def get_shops_with_books_by_publisher(slug)
      Shop.connection.select_all("
				SELECT sh.id as shop_id, sh.name, sh.total_sold, b.id as book_id, b.title, st.amount
				FROM shops sh
				INNER JOIN stores st on sh.id = st.shop_id
				INNER JOIN books b on b.id = st.book_id
				INNER JOIN publishers p on p.id = b.publisher_id
				WHERE p.slug like '#{slug}'
				ORDER BY sh.total_sold DESC")
          .to_a
    end

    # Makes order transaction for specific shop and book
    #
    # @param shop [Shop] Shop instance
    # @param book [Book] Book instance
    # @param amount [Integer] Count of books for order
    # @return [Order] New Order instance
    # @raise [StandardError]
    def make_order(shop, book, amount)
      order = Order.new(shop: shop, book: book, amount: amount)
      shop.transaction do
        store = StoreRepository.get_store_by_shop_id_and_book_id_for_order(shop.id, book.id)
        shop.total_sold += order.amount
        store.amount -= order.amount

        raise StandardError, 'Not enough books' if store.amount.negative?

        order.save!
        shop.save!
        store.save!
      end

      order
    end

    # Find shop by id for make an order.
    # If shop has been found, it will be locked for transaction.
    # Otherwise method will raise an exception
    #
    # @param shop_id [Integer] Shop instance
    # @return [Shop] Shop instance
    # @raise [StandardError]
    def get_shop_for_order(shop_id)
      @shop = Shop.lock.find(shop_id)
    rescue StandardError => e
      raise StandardError, 'Shop not found'
    end

    # Find book in shop's store by id.
    #
    # @param shop [Shop] Shop instance
    # @param book_id [Integer] ID of book
    # @return [Book] Book instance
    # @return [nil] if book not found
    def get_book_of_shop_by_id(shop, book_id)
      shop.books.where(id: book_id).first
    end
  end
end
