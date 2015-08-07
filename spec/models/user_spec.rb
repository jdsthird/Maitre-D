require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(first_name: "John", last_name: "Doe", email: "a@b.c", username: "JohnnyBoy", password: "12345") }

  describe "Validations" do
    it "requires a first name" do
      expect(User.new(first_name: "", last_name: "Doe", email: "a@b.c", username: "JohnnyBoy", password: "12345")).to_not be_valid
    end

    it "requires a last name" do
      expect(User.new(first_name: "John", last_name: "", email: "a@b.c", username: "JohnnyBoy", password: "12345")).to_not be_valid
    end

    it "requires an email address" do
      expect(User.new(first_name: "John", last_name: "Doe", email: "", username: "JohnnyBoy", password: "12345")).to_not be_valid
    end

    it "requires a username" do
      expect(User.new(first_name: "John", last_name: "Doe", email: "a@b.c", username: "", password: "12345")).to_not be_valid
    end

    it "requires a password" do
      expect(User.new(first_name: "John", last_name: "Doe", email: "a@b.c", username: "JohnnyBoy")).to_not be_valid
    end
  end

  describe "#password" do
    it "returns a BCrypt Password object" do
      expect(user.password).to be_a BCrypt::Password
    end
  end

  describe "#authenticate" do
    it "returns true when the correct raw password is supplied" do
      expect(user.authenticate("12345")).to be true
    end

    it "returns false otherwise" do
      expect(user.authenticate("123")).to be false
    end
  end
end