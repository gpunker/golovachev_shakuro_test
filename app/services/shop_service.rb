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
			shops = ShopRepository.get_shops_with_books_by_publisher(slug).group_by { |i| i['name'] }
			shops
		end
	end
end