# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  amount     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  index_stores_on_book_id  (book_id)
#  index_stores_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (shop_id => shops.id)
#
class Store < ApplicationRecord
  validates :amount, presence: true

  belongs_to :book
  belongs_to :shop
end
