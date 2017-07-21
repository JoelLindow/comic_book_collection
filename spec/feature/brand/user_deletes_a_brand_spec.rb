require 'rails_helper'

RSpec.feature "User can delete a brand" do
  it "a user deletes a brand" do
    brand_one = Brand.create!(name: "DC")
    brand_two = Brand.create!(name: "Marvel")

    visit brands_path

    expect(page).to have_content("DC")
    expect(page).to have_content("Marvel")

    within(".brand_#{brand_two.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("DC")
    expect(page).to_not have_content("Marvel")
  end
end
