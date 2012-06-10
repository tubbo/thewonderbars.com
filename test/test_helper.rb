ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'bundler'
Bundler.setup :default, :test

class ActiveSupport::TestCase
  #fixtures :all

  Bundler.require :default, :test

  VCR.configure do |c|
    c.cassette_library_dir = 'test/fixtures/cassettes'
    c.hook_into :webmock # or :fakeweb
    # c.allow_http_connections_when_no_cassette = true
  end
end
