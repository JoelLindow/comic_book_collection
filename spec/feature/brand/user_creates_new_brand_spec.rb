require 'rails_helper'

RSpec.feature "Logged in user creates a new brand", type: :feature do
  scenario "a logged in user can create a new brand for a book" do
    user = User.create!(username: "Bruce", password: "1234")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_brand_path

    fill_in "brand[name]", with: "DC"

    click_button "Create"

    expect(current_path).to eq(brands_path)

    expect(page).to have_content("DC")
    expect(Brand.count).to eq(1)
  end
end
