require 'rails_helper'

RSpec.feature "When a user visits site" do
  it "user can create and account" do
    visit new_user_path

    fill_in "Username", with: "BruceWayne"
    fill_in "Password", with: "password"
    click_button "Create Account"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Welcome, BruceWayne")
  end
end
