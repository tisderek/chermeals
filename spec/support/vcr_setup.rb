require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock

  # only want VCR to intercept requests to external URLs
  config.ignore_localhost = true

  # obfuscate sensitive data in VCR replays
  config.filter_sensitive_data('<FULLCONTACT_API_REQUEST_WITH_VALID_COMPANY_DOMAIN>') do |interaction|
    "https://api.fullcontact.com/v2/company/lookup.json?apiKey=#{ENV['FULLCONTACT_KEY']}&domain=bugcrowd.com"
  end

  # hide sensitive information in cassettes
  config.filter_sensitive_data('<FULLCONTACT_API_REQUEST_WITH_INEXISTENT_COMPANY_DOMAIN>') do |i|
    "https://api.fullcontact.com/v2/company/lookup.json?apiKey=#{ENV['FULLCONTACT_KEY']}&domain=inexistent-company-domain.com"
  end

end