class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.references :guest, index: true
      t.references :pair, references: :guests, index: true

      t.timestamps null: false
    end
  end
end
