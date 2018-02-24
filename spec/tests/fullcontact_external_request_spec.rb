require 'rails_helper'
require 'faker'

feature "Fullcontact external request" do
  describe "company information" do
    let(:request_base_uri) {
      "https://api.fullcontact.com/v2/company/lookup.json?apiKey=#{ENV["FULLCONTACT_KEY"]}&domain="
    }

    context "company domain is inexistent-company-domain.com " do
      it "uses cassette if its VCR cassette usage is specified" do
        VCR.use_cassette("fullcontact_not_found") do
          request_uri = request_base_uri + "inexistent-company-domain.com"
          response = Net::HTTP.get(URI(request_uri))
          expect(response).to be_an_instance_of(String)
        end
      end

      it "raises VCR error if VCR cassette usage is not specified" do
          request_uri = request_base_uri + "inexistent-company-domain.com"
          expect { Net::HTTP.get(URI(request_uri)) }.to raise_error(VCR::Errors::UnhandledHTTPRequestError)
      end
    end

    context "company domain is not inexistent-company-domain.com" do
      let(:company_name) { Faker::SiliconValley.company.gsub("-", " ") }
      let!(:response) do
        domain = "#{company_name.parameterize}.#{Faker::Internet.domain_suffix}"
        Net::HTTP.get(URI(request_base_uri + domain))
      end

      it "does not use cassette" do
        expect(VCR.current_cassette).to be_nil
      end

      it "stubbed response has the expected keys" do
        parsed_response = JSON.parse(response)
        expect(parsed_response.keys).to include("organization")
        expect(parsed_response["organization"].keys).to include("name")
      end

      it "stubbed response has a company name with a suffix" do
        parsed_response = JSON.parse(response)
        expect(parsed_response.keys).to include("organization")
        expect(parsed_response["organization"]["name"]).to eq company_name + " Inc"
      end

    end
  end
end
