require 'rails_helper'

feature "group onboarding following member registration" do

  scenario "when member registers without a group" do
    visit new_member_registration_path
    fill_in_registration_fields
    expect(page).to have_content("Please create a group")
    fill_in_group_creation_fields
  end

  def fill_in_group_creation_fields
    company = Faker::Name.first_name # change to company name
    fill_in "group[name]", with: "#{company} HQ"
    fill_in "group[description]", with: "Group for folks at #{company} HQ to share extra meal kits!"
    click_button "Create Group"
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