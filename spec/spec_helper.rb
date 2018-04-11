require 'capybara/rspec'
require 'capybara'
require 'rspec'
# require 'features/web_helpers'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    load './spec/setup_test_database.rb'
  end
end

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
