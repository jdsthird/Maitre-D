require 'rails_helper'

RSpec.describe Table, type: :model do

  let(:event) { Event.new(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now) }

  describe "validations" do
    it "requires a number of seats" do
      expect(Table.new(event: event)).to_not be_valid
    end

    it "requires an event" do
      expect(Table.new(number_of_seats: 7)).to_not be_valid
    end
  end
end