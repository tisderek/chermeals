require 'rails_helper'

feature "member onboarding" do

  scenario "prospect member can sign up with email" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Get started"

    fill_in_registration_fields
    expect(page).to have_content("Welcome!")
    expect(current_path).to eq meals_path
  end

  def fill_in_registration_fields
    fill_in "member[name]", with: Faker::Name.first_name
    fill_in "member[email]", with: Faker::Internet.email
    password = Devise.friendly_token.first(8)
    fill_in "member[password]", with: password
    fill_in "member[password_confirmation]", with: password
    click_button "Sign up"
  end

end