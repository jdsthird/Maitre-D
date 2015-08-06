class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string     :first_name
      t.string     :last_name
      t.references :event
      t.references :table
      t.integer    :seat_number

      t.timestamps null: false
    end
  end
end
