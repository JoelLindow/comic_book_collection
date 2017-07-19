require 'rails_helper'

describe "User creates a new brand" do
  xit "a user can create a new brand for a book" do
    visit new_brand_path

    fill_in "brand[name]", with: "DC"

    click_button "Create"

    expect(current_path).to eq(brands_path)

    expect(page).to have_content("DC")
    expect(Brand.count).to eq(1)
  end
end
