class Pairing < ActiveRecord::Base
  belongs_to :guest
  belongs_to :pair, class_name: "Guest"

  validates_presence_of :guest
  validates_presence_of :pair
end
