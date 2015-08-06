class Event < ActiveRecord::Base
  belongs_to :host, class_name: :"User"

  validates_presence_of
end
