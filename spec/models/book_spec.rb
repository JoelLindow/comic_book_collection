require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        brand = Brand.create(name: "DC")
        book = brand.books.new(issue_number: 5, img_url: "batman pic", description: "Good comic book", brand_id: brand)
        expect(book).to be_invalid
      end

      it "is invalid without issue_number" do
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", img_url: "batman pic", description: "Good comic book", brand_id: brand.id)
        expect(book).to be_invalid
      end

      it "is invalid without description" do
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", issue_number: 5, img_url: "batman pic", brand_id: brand.id)
        expect(book).to be_invalid
      end

      it "is invalid without brand" do
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", issue_number: 5, img_url: "batman pic", description: "Good comic book")
        expect(book).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with attributes" do
        brand = Brand.create(name: "DC")
        book = Book.new(title: "Batman Adventures", issue_number: 5, img_url: "batman pic", description: "Good comic book", brand_id: brand.id)
        expect(book).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a brand" do
      brand = Brand.create(name: "DC")
      book = Book.new(title: "Batman Adventures", issue_number: 5, img_url: "batman pic", description: "Good comic book", brand_id: brand.id)
      expect(book).to respond_to(:brand)
    end
  end
end
