class Collection < ActiveRecord::Base
  has_many :guests

  def merge(collection)
    collection.guests.map do |guest|
      self.guests << guest
    end
    self.num_guests += collection.num_guests
    self.save!
    collection.destroy
  end
end
