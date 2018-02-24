require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock

  # only want VCR to intercept requests to external URLs
  config.ignore_localhost = true

  # ignored request gets passed to webmock so it can stub it
  config.ignore_request do |request|
    request.uri.include?("api.fullcontact.com/v2/company/lookup=") && request.uri.split("domain=").last != "inexistent-company-domain.com"
  end

  # hide sensitive information in cassettes
  config.filter_sensitive_data('<FULLCONTACT_API_REQUEST_WITH_INEXISTENT_COMPANY_DOMAIN>') do |i|
    "https://api.fullcontact.com/v2/company/lookup.json?apiKey=#{ENV['FULLCONTACT_KEY']}&domain=inexistent-company-domain.com"
  end

end
