ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'bundler'
require 'vcr'
require 'webmock'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  Bundler.require :test

  VCR.configure do |c|
    c.cassette_library_dir = 'fixtures/cassettes'
    c.hook_into :webmock # or :fakeweb
    # c.allow_http_connections_when_no_cassette = true
  end
end
