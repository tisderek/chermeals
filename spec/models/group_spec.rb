require 'rails_helper'

RSpec.describe Group, type: :model do

  it { should have_many(:memberships) }
  it { should have_many(:members).through(:memberships) }

end
