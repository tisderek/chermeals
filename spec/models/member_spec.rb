require 'rails_helper'

RSpec.describe Member, type: :model do

  it { should belong_to(:group) } # test that it is optional
  it { should have_many(:received_gifts).class_name('Gift').with_foreign_key("receiver_id") }
  it { should have_many(:provided_gifts).class_name('Gift').with_foreign_key("provider_id") }
  it { should have_many(:provided_meals).class_name('Meal').with_foreign_key("provider_id") }

end
