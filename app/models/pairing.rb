class Pairing < ActiveRecord::Base
  belongs_to :guest
  belongs_to :pair, class_name: "Guest"
end
