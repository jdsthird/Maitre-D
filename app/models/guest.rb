class Guest < ActiveRecord::Base
  belongs_to :event
  belongs_to :table
  has_many :pairings
  has_many :pairs, through: :pairings

  validates :event, presence: true
end
