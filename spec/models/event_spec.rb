require 'rails_helper'

RSpec.describe Event, type: :model do

  # let(:event) { Event.new(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now) }

  describe "validations" do
    it "must have a name" do
      expect(Event.new(name: "", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now)).to_not be_valid
    end

    it "must have a zip code" do
      expect(Event.new(name: "p", zip_code: "", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now)).to_not be_valid
    end

    it "must have a state" do
      expect(Event.new(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now)).to_not be_valid
    end

    it "must have the first line of an address" do
      expect(Event.new(name: "p", zip_code: "12345", state: "", address_line_one: "123 Elm St.", begins_at: Time.now)).to_not be_valid
    end

    it "must have a start time" do
      expect(Event.new(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.")).to_not be_valid
    end
  end
end