# frozen_string_literal: true

# Creating a shop table
class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :slug

      t.timestamps
    end
  end
end
