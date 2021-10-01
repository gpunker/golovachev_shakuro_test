json.shops do
	json.array! @shops do |shop|
		json.id shop.id
		json.name shop.name
		json.books_sold_count
		json.books_in_stock do
			json.array! shop.books do |book|
				json.id book.id
				json.title book.title
			end
		end
	end
end