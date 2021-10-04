# frozen_string_literal: true

class AddTotalSoldToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :total_sold, :integer, default: 0
  end
end
