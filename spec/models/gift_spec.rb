require 'rails_helper'

RSpec.describe Gift, type: :model do

  it { should belong_to(:provider).class_name('Member') }
  it { should belong_to(:receiver).class_name('Member') }
  it { should belong_to(:meal) }

end
