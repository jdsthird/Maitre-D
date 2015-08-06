class Event < ActiveRecord::Base
  belongs_to :host, class_name: :"User"
  has_many :tables
  has_many :guests


  validates_presence_of :name
  validates_presence_of :zip_code
  validates_presence_of :state
  validates_presence_of :address_line_one
  validates_presence_of :begins_at
  validates_presence_of :host_id
end
