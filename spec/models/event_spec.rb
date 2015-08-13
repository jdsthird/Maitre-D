require 'rails_helper'

RSpec.describe Event, type: :model do

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

  describe "edit" do
    let(:event) { Event.create(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now) }

    it 'changes the values of the event' do
      event.name = "q"
      expect(event.name).not_to eq("p")
    end
  end

  describe '#destroy' do
    let(:event) { Event.create(name: "p", zip_code: "12345", state: "IL", address_line_one: "123 Elm St.", begins_at: Time.now) }

    it 'deletes the event' do
      expect(event).to be_instance_of(Event)
      event.destroy
      expect(event.id).to be nil
    end
  end
end