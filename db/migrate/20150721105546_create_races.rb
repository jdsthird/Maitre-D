class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.integer :winner_id
      t.timestamps
    end
  end
end
