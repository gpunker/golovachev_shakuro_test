# frozen_string_literal: true

# == Schema Information
#
# Table name: publishers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_publishers_on_name  (name) UNIQUE
#
class Publisher < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :books
end
