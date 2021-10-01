# frozen_string_literal: true

# Adds uniq index to name field
class AddUniqNameIndexToShops < ActiveRecord::Migration[6.1]
  def change
    add_index :shops, :name, unique: true
  end
end
