require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do

    stub_request(
      :get,
      /^https:\/\/api.fullcontact.com\/v2\/company\/lookup.*(?<!inexistent-company-domain.com)$/
    ).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})

  end
end
