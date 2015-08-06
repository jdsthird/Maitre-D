class Race < ActiveRecord::Base

      # t.string :name
      # t.integer :winner_id
      # t.timestamps


  has_many :appearances
  has_many :racers, through: :appearances, source: :user
  belongs_to :winner, class_name: "User"
end
