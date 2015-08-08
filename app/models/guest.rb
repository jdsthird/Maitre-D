class Guest < ActiveRecord::Base
  belongs_to :event
  belongs_to :table
  has_many :pairings
  has_many :pairs, through: :pairings

  validates_presence_of :event
  validates_presence_of :first_name

  def happy?(guests)
    (self.pairs & guests) == self.pairs
  end
end
