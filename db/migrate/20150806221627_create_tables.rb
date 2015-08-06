class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :number		
      t.integer :number_of_seats null: false
      t.references :event null: false

      t.timestamps null: false
    end
  end
end
