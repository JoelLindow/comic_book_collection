require 'rails_helper'

RSpec.feature "User creates a new book" do
  scenario "a user can create a new book" do
    user = User.create!(username: "Bruce", password: "1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    Brand.create!(name: "DC")
    Series.create!(name: "The Dark Knight Returns")
    visit "books/new"

    fill_in "book[title]", with: "Batman Adventures"
    select "The Dark Knight Returns", from: "book_series_id"
    fill_in "book[issue_number]", with: 1
    fill_in "book[description]", with: "First book of the series"
    fill_in "book[img_url]", with: "http://batmanpicture.jpg"
    select "DC", from: "book_brand_id"

    click_button "Create"

    expect(Book.count).to eq(1)
    book = Book.last
    expect(current_path).to eq(book_path(book))
    expect(page).to have_content("Batman Adventures")
    expect(page).to have_content("1")
    expect(page).to have_content("First book of the series")
  end
end
