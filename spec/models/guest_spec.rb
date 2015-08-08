require 'rails_helper'

RSpec.describe Guest, type: :model do
  let(:event) { Event.new(name: "The burning of Frodo", zip_code: "666", state: "WI", address_line_one: "1 Mount Doom Place", begins_at: Time.now) }
  let(:guest) { Guest.new(first_name: "Samwise", event: event) }

  describe "validations" do
    it "requires a first name" do
      expect(Guest.new(first_name: "", event: event)).to_not be_valid      
    end

    it "requires an event" do
      expect(Guest.new(first_name: "Samwise")).to_not be_valid
    end
  end

  describe "#happy?" do
    let(:guests) { Array.new(5) { Guest.new(first_name: "a", event: event) } }
    it "takes an array of guest ids as its argument" do
      expect { guest.happy?(guests) }.to_not raise_error
    end
  end
end