require 'rails_helper'

feature "visitors get to home page" do

  scenario "prospect member can sign up with email" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Sign up"
    fill_in_registration_fields
    expect(page).to have_content("Weocome! You have signed up successfully.")
  end

  scenario "prospect member can sign up with google" do
    visit root_path
    expect(page).to have_text("Welcome to chermeals!")
    click_link "Sign up"
    click_link "Sign in with GitHub"
    expect(page).to have_link "Sign out"

    last_member = Member.last

    expect(member.provider).to eq 'google'
    expect(member.uid).to eq '123545'
  end

  def fill_in_registration_fields
    fill_in "member[first_name]", with: Faker::Name.first_name
    fill_in "member[last_name]", with: Faker::Name.last_name
    fill_in "member[email]", with: Faker::Internet.email
    fill_in "member[password]", with: Devise.friendly_token
    click_button "Sign up"
  end

end