require 'rails_helper'

RSpec.feature "adding to collection" do
  scenario "logged in user creates a new book" do

    #WRITE THIS TEST!
  end

  scenario "logged in user adds book from database to collection" do
    user = User.create!(username: "Bruce", password: "1234")
    brand = Brand.create!(name: "DC")
    series = Series.create!(name: "The Dark Knight Returns")
    Book.create!(title: "Batman Adventures",
                            series_id: series.id,
                            issue_number: 1,
                            img_url: "http://vignette1.wikia.nocookie.net/suburgatory/images/5/52/Happy_face.jpg/revision/latest?cb=20120412051836",
                            brand: brand,
                            description: "Bat-tastic")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    #STUB - Tells all controllers to receive the moethod current user and return the user we just created in test

    visit books_path

    click_on "Add to Collection"

    visit collection_path

    expect(page).to have_content("Batman Adventures")
    expect(page).to have_content("DC")
    expect(page).to have_content("The Dark Knight Returns")
  end
end
