require 'rails_helper'

RSpec.describe SeatingHelper, type: :helper do

  let(:host) { User.create!(first_name: "a", last_name: "b", email: "a@b.c", username: "d", password_hash: BCrypt::Password.create("1"))}
  let(:event) { Event.create!(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now, host: host) }
  let(:guest) { Guest.create!(first_name: "sam", event: event) }
  let(:guests) { Array.new(5) { Guest.create!(first_name: "guest", event: event) } }
  let(:table) { Table.create!(number_of_seats: 5, event: event) }
  let(:tables) { Array.new(2) { Table.create!(number_of_seats: 5, event: event) } }

  describe "#group_guests" do
    xit "accepts an array of guests as its argument" do
      expect{ group_guests(guests) }.to_not raise_error
    end

    xit "returns an array of arrays" do
      expect(group_guests(guests)).to satisfy { |group| group.class == Array }
    end

    xit "groups pairs together" do
      guests.each { |g| guest.pairs << g }
      p output = group_guests(guests << guest)
      expect(output.length).to eq 1
    end
  end

  describe "#seat_guests" do
    xit "returns an array of tables" do

    end

    xit "correctly maps guests to tables" do
      
    end
  end

  describe "#tables_valid?" do
    it "returns false if any table is not valid" do
      guests.first.pairs << guest
      tables[0].guests += guests
      tables[1].guests << guest
      expect(tables_valid?(tables)).to be false
    end

    it "returns true when all tables are valid" do
      table.stub(:valid_seating?).and_return true
      expect(tables_valid?(tables)).to be true
    end
  end
end