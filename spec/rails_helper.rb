ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'database_cleaner'
require 'capybara/rspec'
require 'email_spec'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

# work around for failing integration spec
module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end

RSpec.configure do |config|
# below line is added to pass tests in features ( to access rails roots in integration)
  config.include Rails.application.routes.url_helpers

  config.include FactoryGirl::Syntax::Methods
  #config.include Devise::TestHelpers, type: :controller
  config.order = "random"
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end