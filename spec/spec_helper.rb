RSpec.configure do |config|

  config.mock_with :rspec do |mocks|
    # Prevents mocking/stubbing method that does not exist on real object.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

end
  RSpec::Expectations.configuration.on_potential_false_positives = :nothing
