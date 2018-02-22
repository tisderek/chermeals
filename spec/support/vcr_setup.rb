require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock

  # only want VCR to intercept requests to external URLs
  config.ignore_localhost = true
