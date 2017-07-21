require 'rails_helper'

RSpec.describe Series, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without name" do
        series = Series.new()
        expect(series).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with name" do
        series = Series.new(name: "Action Comics")
        expect(series).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many books" do
      series = Series.new(name: "Action Comics")
      expect(series).to respond_to(:books)
    end
  end
end
