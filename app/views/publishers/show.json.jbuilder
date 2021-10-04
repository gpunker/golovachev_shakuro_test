json.shops do
	json.array! @shop_keys do |shop_key|
		json.id @shops[shop_key][0]["shop_id"]
		json.name shop_key
		json.books_sold_count
		json.books_in_stock do
			json.array! @shops[shop_key] do |book|
				json.id book['book_id']
				json.title book['title']
				json.copies_in_stock book['amount']
			end
		end
	end
end