# frozen_string_literal: true

# Adds uniq index to name field
class AddUniqNameIndexToPublishers < ActiveRecord::Migration[6.1]
  def change
    add_index :publishers, :name, unique: true
  end
end
