class User < ActiveRecord::Base
      # t.string :username
      # t.string :password
      # t.timestamps



  has_many :appearances
  has_many :races, through: :appearances
  has_many :wins, class_name: "Race", foreign_key: :winner_id
end
