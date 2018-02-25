require 'rails_helper'

feature "member signup" do

  scenario "can sign up with work email" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Get started"
    fill_in_registration_fields
    fill_in "member[email]", with: "test@apple.com"
    expect(page).to have_content("Welcome!")
  end

  scenario "cannot sign up with free email" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Get started"
    fill_in_registration_fields
    fill_in "member[email]", with: "test@gmail.com"
    expect(page).to have_content("Welcome!")
  end

  def fill_in_registration_fields
    fill_in "member[name]", with: Faker::Name.first_name
    fill_in "member[email]", with: Faker::Internet.email
    password = Devise.friendly_token.first(8)
    fill_in "member[password]", with: password
    fill_in "member[password_confirmation]", with: password
  end

end