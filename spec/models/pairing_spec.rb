require 'rails_helper'

RSpec.describe Pairing, type: :model do
  let(:user) { User.create!(first_name: "a", last_name: "b", email: "a@b.c", username: "d", password_hash: BCrypt::Password.create("1"))}
  let(:event) { Event.create!(name: "The burning of Frodo", zip_code: "666", state: "WI", address_line_one: "1 Mount Doom Place", begins_at: Time.now, host: user) }
  let(:guest) { Guest.create!(first_name: "Samwise", event: event) }
  let(:pair) { Guest.create!(first_name: "Frodo", event: event) }
  let(:pairing) { Pairing.create!(guest: guest, pair: pair) }

  describe '#twin and #check_and_make_pair' do
    it 'find the Pairing\'s reciprocal pairing' do
      expect(pairing.twin).to be_a Pairing
    end
  end

  describe 'filter' do
    it 'removes symmetric pairings from a collection of pairings' do
      expect(Pairing.filter_symmetric_pairings([pairing, pairing.twin])).to eq [pairing]
    end
  end
end