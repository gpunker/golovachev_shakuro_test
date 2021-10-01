# frozen_string_literal: true

# Creating a publisher table
class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name, null: false, uni
      t.string :slug

      t.timestamps
    end
  end
end
