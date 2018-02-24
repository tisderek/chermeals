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
      before do
        company_url_without_protocol = Faker::SiliconValley.url.split("//").last
        request_uri = request_base_uri + company_url_without_protocol
        Net::HTTP.get(URI(request_uri))
      end

      it "does not use cassette" do
        expect(VCR.current_cassette).to be_nil
      end
    end
  end
end
