require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

    stub_request(
      :get,
      /^https:\/\/api.fullcontact.com\/v2\/company\/lookup.*(?<!inexistent-company-domain.com)$/
    ).
      to_return do |request|
        company_domain_name = request.uri.to_s.split("domain=").last.split(".").first
        company_name = company_domain_name.split("-").join(" ").titleize + " Inc"
        {
          status: 200,
          body: {
            organization: {
              name: company_name,
              founded: 2000
            }
          }.to_json
        }
      end
  end
end
