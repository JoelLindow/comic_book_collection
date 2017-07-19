require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        brand = Brand.new()
        expect(brand).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with name" do
        brand = Brand.new(name: "DC")
        expect(brand).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many books" do
      brand = Brand.new(name: "DC")
      expect(brand).to respond_to(:books)
    end
  end
end
