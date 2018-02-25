require 'faker'

FactoryBot.define do
  factory :member do
    name Faker::Name.first_name
    password Faker::Internet.password
    email Faker::Internet.user_name(:name, %w(. _ -)) + '@bugcrowd.com'
  end

  factory :group do
    # company = Faker::SiliconValley.company
    # domain = "#{company.parameterize}.#{Faker::Internet.domain_suffix}"
    # name company
    # domain domain

    trait :with_members do

    end

    trait :with_domain_only do

    end
  end

end