require 'rails_helper'

RSpec.describe Group, type: :model do

  it { should have_many(:memberships) }
  it { should have_many(:members).through(:memberships) }

  describe "before_validation, on create" do
    let(:group) { Group.new(domain: Faker::Internet.domain_name) }

    it "should run the proper callbacks" do
      expect(group).to receive(:get_organization_info)
      expect(group).to receive(:set_name)
      group.validate
    end
  end

  describe "before_create" do
    context "when organization_info is present" do
      let(:group) { Group.new(domain: Faker::Internet.domain_name) }
      before do
        group.validate
      end

      it "runs the #sanitize_company_name callback" do
        expect(group).to receive(:sanitize_company_name)
        group.save
      end

      it "#sanitize_company_name callback works" do
        expect(group.name).to include "Inc"
        group.save
        expect(group.name).not_to include "Inc"
      end

    end

    context "when organization_info is not present" do
      let(:domain) { "inexistent-company-domain.com" }
      let(:group) { build(:group, domain: domain) }

      it "doesn't run the #sanitize_company_name callback" do
        VCR.use_cassette("fullcontact_not_found") do
          group.validate
          expect(group.organization_info).not_to be_present
          expect(group).not_to receive(:sanitize_company_name)
        end
      end
    end
  end

  describe "#get_organization_info" do
    let(:domain) { Faker::Internet.domain_name }
    let(:group) { build(:group, domain: domain) }

    it "uses the Fullcontact API to retrieve company info" do
      expect(FullContact).to receive(:company).with(domain: domain).and_return({})
      group.validate
    end

    context "when domain is an existent company domain" do
      before { group.validate }

      it "sets organization_info" do
        expect(group.organization_info).to be_present
      end
    end

    context "when domain is an inexistent company domain" do
      let(:domain) { "inexistent-company-domain.com" }
      let(:group) { build(:group, domain: domain) }

      it "doesn't raise an exception" do
        VCR.use_cassette("fullcontact_not_found") do
          expect { group.validate }.not_to raise_error(FullContact::NotFound)
        end
      end
    end
  end

  describe "#set_name" do
    let(:domain) { "apple.com" }
    let(:group) { build(:group, domain: domain) }

    context "when organization_info is present" do
      before { group.validate }

      it "uses value for name" do
        expect(group.name).to eq "Apple Inc"
      end
    end

    context "when organization_info is not present" do
      let(:domain) { "inexistent-company-domain.com" }
      let(:group) { build(:group, domain: domain) }

      it "sets name using the domain" do
        VCR.use_cassette("fullcontact_not_found") do
          group.validate
          expect(group.name).to eq "The #{domain} crew"
        end
      end
    end
  end

end
