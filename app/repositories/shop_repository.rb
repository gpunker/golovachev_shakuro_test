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
			shops = Shop.connection.select_all("
				SELECT sh.id as shop_id, sh.name, sh.total_sold, b.id as book_id, b.title, st.amount
				FROM shops sh
				INNER JOIN stores st on sh.id = st.shop_id
				INNER JOIN books b on b.id = st.book_id
				INNER JOIN publishers p on p.id = b.publisher_id
				WHERE p.slug like '#{slug}'
				ORDER BY sh.total_sold DESC")
									.to_a
			shops
		end
	end
end