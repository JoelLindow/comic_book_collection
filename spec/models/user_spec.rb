require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without username" do
        user = User.new(password: "1234")
        expect(user).to be_invalid
      end

      it "is invalid without password" do
        user = User.new(username: "Billy")
        expect(user).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with attributes" do
        user = User.new(username: "Billy", password: "1234")
        expect(user).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many books" do
      user = User.new(username: "Billy", password: "1234")
      expect(user).to respond_to(:books)
    end
  end

  describe "enums" do
    it "can be an admin" do
      user = User.new(username: "Lord BanHammer", password: "1234", role: 1)
      expect(user.admin?).to be true
      expect(user.member?).to be false
    end

    it "can be a member" do
      user = User.new(username: "Sir Noob", password: "4321", role: 0)
      expect(user.member?).to be true
      expect(user.admin?).to be false
    end
  end
end
