class Guest < ActiveRecord::Base
  has_many :pairings
  has_many :pairs, through: :pairings
end
