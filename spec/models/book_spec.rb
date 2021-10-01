# == Schema Information
#
# Table name: books
#
#  id           :bigint           not null, primary key
#  slug         :string
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  publisher_id :bigint
#
# Indexes
#
#  index_books_on_publisher_id  (publisher_id)
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
