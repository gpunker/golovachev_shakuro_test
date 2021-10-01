class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.integer :amount, default: 0
      t.references :book, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
