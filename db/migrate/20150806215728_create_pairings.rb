class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :guest, index: true, null: false
      t.references :pair, references: :guests, index: true, null: false

      t.timestamps null: false
    end
  end
end
