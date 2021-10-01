# frozen_string_literal: true

# Creating a book table
class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :slug

      t.timestamps
    end
  end
end
