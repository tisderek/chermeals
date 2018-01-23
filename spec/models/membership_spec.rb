require 'rails_helper'

RSpec.describe Membership, type: :model do

  it { should belong_to(:member) }
  it { should belong_to(:group) }

  it { should validate_uniqueness_of(:member_id).scoped_to(:group_id) }
  it { should validate_uniqueness_of(:group_id).scoped_to(:member_id) }

end
