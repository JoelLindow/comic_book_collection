require 'rails_helper'

RSpec.feature "User edits a book" do
  scenario " they see the info for the edited book" do
    series = Series.create!(name: "The Dark Knight Returns")
    brand = Brand.create!(name: "DC")
    book = Book.create!(title: "Batman Adventures",
                        series_id: series.id,
                        issue_number: 1,
                        img_url: "http://vignette1.wikia.nocookie.net/suburgatory/images/5/52/Happy_face.jpg/revision/latest?cb=20120412051836",
                        brand: brand,
                        description: "Fun fun fun")


    visit book_path(book)
    expect(page).to have_content("Batman Adventures")
    expect(page).to have_content("The Dark Knight Returns")
    expect(page).to have_content("1")
    expect(page).to have_content("DC")
    expect(page).to have_content("Fun fun fun")

    # save_and_open_page

    click_on "Edit Book Information"

    fill_in "book[title]", with: "Detective Comics"

    click_on "Update"

    expect(page).to have_content "Detective Comics"
  end
end
