# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string
#  total_sold :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shops_on_name  (name) UNIQUE
#
class Shop < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :stores
  has_many :books, through: :stores
end
