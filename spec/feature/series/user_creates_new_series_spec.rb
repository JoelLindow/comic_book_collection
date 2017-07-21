require 'rails_helper'

RSpec.feature "User creates a new series", type: :feature do
  scenario "a user can create a new series for a book" do
    visit new_series_path

    fill_in "series[name]", with: "The Dark Knight Returns"

    click_button "Create"

    expect(current_path).to eq(series_index_path)

    expect(page).to have_content("The Dark Knight Returns")
    expect(Series.count).to eq(1)
  end
end
