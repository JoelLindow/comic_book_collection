require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create!(name: "DC")
        book = brand.books.new( series_id: series.id, issue_number: 5, img_url: "batman pic", description: "Good comic book", brand: brand)
        expect(book).to be_invalid
      end

      it "is invalid without series" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", issue_number: 5, img_url: "batman pic", description: "Good comic book", brand: brand)
        expect(book).to be_invalid
      end

      it "is invalid without issue_number" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", series_id: series.id, img_url: "batman pic", description: "Good comic book", brand: brand)
        expect(book).to be_invalid
      end

      it "is invalid without description" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create!(name: "DC")
        book = Book.new(title: "Batman Adventures", series_id: series.id, issue_number: 5, img_url: "batman pic", brand: brand)
        expect(book).to be_invalid
      end

      it "is invalid without brand" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", series_id: series.id, issue_number: 5, img_url: "batman pic", description: "Good comic book")
        expect(book).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with attributes" do
        series = Series.create!(name: "Detective Comics")
        brand = Brand.create!(name: "DC")
        book = Book.new(title: "Batman Adventures", series_id: series.id, issue_number: 5, img_url: "batman pic", description: "Good comic book", brand: brand)
        expect(book).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a brand" do
      series = Series.create!(name: "Detective Comics")
      brand = Brand.create!(name: "DC")
      book = Book.new(title: "Batman Adventures", series_id: series.id, issue_number: 5, img_url: "batman pic", description: "Good comic book", brand: brand)
      expect(book).to respond_to(:brand)
    end

    it "belongs to a series" do
      series = Series.create!(name: "Detective Comics")
      brand = Brand.create!(name: "DC")
      book = Book.new(title: "Batman Adventures", series_id: series.id, issue_number: 5, img_url: "batman pic", description: "Good comic book", brand: brand)
      expect(book).to respond_to(:series)
    end
  end
end
