require 'rails_helper'

RSpec.describe Member, type: :model do

  it { should have_many(:memberships) }
  it { should have_many(:groups).through(:memberships) }
  it { should have_many(:received_gifts).class_name('Gift').with_foreign_key("receiver_id") }
  it { should have_many(:provided_gifts).class_name('Gift').with_foreign_key("provider_id") }

  it { should have_many(:meals) }
end
