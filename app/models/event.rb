class Event < ActiveRecord::Base
  belongs_to :host, class_name: :"User"
  has_many :tables
  has_many :guests
  has_many :pairings, through: :guests


  validates_presence_of :name, message: "-- Please provide a name for this event."
  validates_presence_of :address_line_one, message: "-- Pardon me, but where will your event be located?"
  validates_presence_of :state, message: "-- Please provide the state in which your event is located."
  validates_presence_of :zip_code, message: "-- We're sorry, but we will require a zip code for your event's location."
  validates_presence_of :begins_at, message: "-- Please provide a start date and time for the event."
  validates_presence_of :host_id


  def set_tables(table_arg)
  	i = 1
  	table_arg[:number].to_i.times do
  		Table.set_table(table_arg[:number_of_seats], i, self)
  		i +=1
  	end
  end
end
