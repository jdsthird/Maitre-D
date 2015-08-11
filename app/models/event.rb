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


  def set_tables(table_arg)
  	i = 1
  	table_arg[:number].to_i.times do
  		Table.set_table(table_arg[:number_of_seats], i, self)
  		i +=1
  	end
  end
end
