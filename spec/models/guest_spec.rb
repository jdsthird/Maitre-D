require 'rails_helper'

RSpec.describe Guest, type: :model do
  let(:user) { User.create!(first_name: "a", last_name: "b", email: "a@b.c", username: "d", password_hash: BCrypt::Password.create("1"))}
  let(:event) { Event.create!(name: "The burning of Frodo", zip_code: "666", state: "WI", address_line_one: "1 Mount Doom Place", begins_at: Time.now, host: user) }
  let(:guest) { Guest.create!(first_name: "Samwise", event: event) }

  describe "validations" do
    it "requires a first name" do
      expect(Guest.new(first_name: "", event: event)).to_not be_valid      
    end

    it "requires an event" do
      expect(Guest.new(first_name: "Samwise")).to_not be_valid
    end
  end

  describe "#happy?" do
    let(:guests) { Array.new(5) { Guest.create!(first_name: "a", event: event) } }
    it "takes an array of guest ids as its argument" do
      expect { guest.happy?(guests.map{|guest| guest.id}) }.to_not raise_error
    end

    it "returns false when a pair is missing" do
      guest.pairs << Guest.create!(first_name: "pair", event: event)
      expect(guest.happy?(guests.map(&:id))).to be false
    end

    it "returns true otherwise" do
      pair = Guest.create!(first_name: "pair", event: event)
      guest.pairs << pair
      guests << pair
      # guest_ids = guests.map { |guest| guest.id }
      expect(guest.happy?(guests.map(&:id))).to be true
    end
  end
end