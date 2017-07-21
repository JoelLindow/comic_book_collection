require 'rails_helper'

RSpec.feature "User can login" do
  scenario "existing member user can log in" do
    User.create!(username: "BruceWayne", password: "password")

    visit login_path

    fill_in "Username", with: "BruceWayne"
    fill_in "Password", with: "password"
    click_button "Login"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("BruceWayne")
  end
end
