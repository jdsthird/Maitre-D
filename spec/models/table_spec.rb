require 'rails_helper'

RSpec.describe Table, type: :model do

  let(:host) { User.create!(first_name: "a", last_name: "b", email: "a@b.c", username: "d", password_hash: BCrypt::Password.create("1"))}
  let(:event) { Event.create!(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now, host: host) }
  let(:guest) { Guest.create!(first_name: "sam", event: event) }
  let(:table) { Table.create!(number_of_seats: 5, event: event) }

  describe "validations" do
    it "requires a number of seats" do
      expect(Table.new(event: event)).to_not be_valid
    end

    it "requires an event" do
      expect(Table.new(number_of_seats: 7)).to_not be_valid
    end
  end

  describe "#overflowing?" do
    it "returns true when the table has more seated guests than space" do
      (table.number_of_seats + 1).times do
        table.guests << Guest.new(first_name: "sam", event: event)
      end
      expect(table.overflowing?).to be true
    end

    it "returns true when the table is at or below capacity" do
      table.number_of_seats.times do
        table.guests << Guest.new(first_name: "sam", event: event)
      end
      expect(table.overflowing?).to be false
    end
  end

  describe "#guests_happy?" do
    it "returns false if any guest is unhappy" do
      pair = Guest.create!(first_name: "pair", event: event)
      guest.pairs << pair
      table.guests << guest
      expect(table.guests_happy?).to be false
    end

    it "returns true when all guests are happy" do
      pair = Guest.create!(first_name: "pair", event: event)
      guest.pairs << pair
      table.guests += [guest, pair]
      expect(table.guests_happy?).to be true
    end
  end

  describe "#valid_seating?" do
    it "returns false when the table is overflowing" do
      table.stub(:overflowing?).and_return(true)
      table.stub(:guests_happy?).and_return(true)
      expect(table.valid_seating?).to be false
    end

    it "returns false when the guests are not all happy" do
      table.stub(:overflowing?).and_return(false)
      table.stub(:guests_happy?).and_return(false)
      expect(table.valid_seating?).to be false
    end

    it "returns true otherwise" do
      table.stub(:overflowing?).and_return(false)
      table.stub(:guests_happy?).and_return(true)
      expect(table.valid_seating?).to be true
    end
  end
end