# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  amount     :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :bigint           not null
#  shop_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_book_id  (book_id)
#  index_orders_on_shop_id  (shop_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (shop_id => shops.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
