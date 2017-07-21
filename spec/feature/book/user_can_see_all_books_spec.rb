require 'rails_helper'

RSpec.feature "User sees all books" do
  scenario "a user sees all books" do
    brand_one = Brand.create!(name: "DC")
    series_one = Series.create!(name: "The Dark Knight Returns")
    book_one = Book.create!(title: "Batman Adventures",
                            series_id: series_one.id,
                            issue_number: 1,
                            img_url: "http://vignette1.wikia.nocookie.net/suburgatory/images/5/52/Happy_face.jpg/revision/latest?cb=20120412051836",
                            brand: brand_one,
                            description: "Bat-tastic")

    brand_two = Brand.create!(name: "Marvel")
    series_two = Series.create!(name: "Civil War")
    book_two = Book.create!(title: "Spiderman",
                            series_id: series_two.id,
                            issue_number: 1,
                            img_url: "http://vignette1.wikia.nocookie.net/suburgatory/images/5/52/Happy_face.jpg/revision/latest?cb=20120412051836",
                            brand: brand_two,
                            description: "Spiderific")

    visit books_path

    expect(page).to have_content("The Dark Knight Returns")
    expect(page).to have_content("DC")
    expect(page).to have_content("Batman Adventures")
    expect(page).to have_content("Civil War")
    expect(page).to have_content("Marvel")
    expect(page).to have_content("Spiderman")
  end
end
