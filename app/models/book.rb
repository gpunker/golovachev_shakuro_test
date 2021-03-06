# frozen_string_literal: true

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
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

  belongs_to :publisher
  has_many :stores
  has_many :shops, through: :stores
end
