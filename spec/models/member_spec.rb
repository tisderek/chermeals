require 'rails_helper'

RSpec.describe Member, type: :model do

  it { should have_many(:memberships) }
  it { should have_many(:groups).through(:memberships) }
  it { should have_many(:received_gifts).class_name('Gift').with_foreign_key("receiver_id") }
  it { should have_many(:provided_gifts).class_name('Gift').with_foreign_key("provider_id") }

  it { should have_many(:meals) }

  describe 'after_create' do
    let(:member) { build(:member) }

    it "should run the proper callbacks" do
      expect(member).to receive(:join_or_create_group)
      member.save
    end
  end

  describe "#join_or_create_group" do
    let(:domain) { "group-domain.com" }
    let(:first_member) { build(:member, email: "first_member@#{domain}") }
    let(:second_member) { build(:member, email: "second_member@#{domain}") }

    context "when there is not a Group with the member email domain" do
      it "creates a Group using the user email domain and adds the user to the group" do
        expect { first_member.save }.to change { Group.count }.from(0).to(1)
        expect(Group.find_by(domain: domain).members).to include(first_member)
      end
    end

    context "when there is already a Group with the member email domain" do
      before { first_member.save }
      it "creates a membership to that Group" do
        expect { second_member.save }.not_to change { Group.count }
        expect(Group.find_by(domain: domain).members).to include(second_member)
      end
    end
  end
end
