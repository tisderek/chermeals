require 'rails_helper'

RSpec.describe Meal, type: :model do

  it { should belong_to(:provider).class_name('Member') }
  it { should have_one(:gift) }
  it { should have_one(:receiver).class_name('Member') }

  # describe "#is_available?" do
  #   xit "is true if meal has no receiver" do
  #   end
  #   xit "is false if meal has a receiver" do
  #   end
  # end

end
