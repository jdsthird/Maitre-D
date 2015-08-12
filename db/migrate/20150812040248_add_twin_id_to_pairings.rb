class AddTwinIdToPairings < ActiveRecord::Migration
  def change
    add_column :pairings, :twin_id, :integer
  end
end
