class AddPublisherReferenceToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :publisher
  end
end
