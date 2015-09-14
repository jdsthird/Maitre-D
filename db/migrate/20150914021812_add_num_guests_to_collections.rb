class AddNumGuestsToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :num_guests, :integer, default: 1
  end
end
