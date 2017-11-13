require 'rails_helper'

feature "visitors get to home page" do

  scenario "prospect user can sign up with email" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Get started"
    fill_in_registration_fields
    expect(page).to have_content("Weocome! You have signed up successfully.")
  end

  scenario "prospect user can sign up with google" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Get started"
    click_link "Sign in with GitHub"
    expect(page).to have_link "Sign out"

    last_user = User.last

    expect(user.provider).to eq 'google'
    expect(user.uid).to eq '123545'
  end

  def fill_in_registration_fields
    fill_in "user[first_name]", with: Faker::Name.first_name
    fill_in "user[last_name]", with: Faker::Name.last_name
    fill_in "user[email]", with: Faker::Internet.email
    fill_in "user[password]", with: Devise.friendly_token
    click_button "Sign up"
  end

end