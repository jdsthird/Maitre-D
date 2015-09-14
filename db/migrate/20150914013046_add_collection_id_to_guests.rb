class AddCollectionIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :collection_id, :integer
  end
end
