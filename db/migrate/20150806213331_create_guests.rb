class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string     :first_name, null: false
      t.string     :last_name
      t.references :event, null: false
      t.references :table
      t.integer    :seat_number

      t.timestamps null: false
    end
  end
end
