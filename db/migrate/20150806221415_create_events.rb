class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null:false
      t.string :zip_code, null: false
      t.string :state, null: false, limit: 2
      t.string :address_line_one, null: false
      t.string :address_line_two
      t.datetime :begins_at, null: false
      t.datetime :ends_at
      t.references :host, null: false

      t.timestamps null: false
    end
  end
end
