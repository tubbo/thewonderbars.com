source 'https://rubygems.org'

group :framework do
  gem 'rails', '3.2.3'
  gem 'pg'
  gem 'unicorn'
  gem 'capistrano'
  gem 'jquery-rails'
  gem 'debugger'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'haml-rails'
  gem 'therubyracer'
  gem 'bootstrap-sass', '~> 2.0.2'
end

group :communication do
  gem 'koala'
  gem 'soundcloud'
end

group :test do
  gem 'vcr', :require=>false
  gem 'webmock', :require=>false
  gem 'turn', '>= 0.9.3'
  gem 'minitest'                      # At least v2.0.2 if using MiniShoulda.
  gem 'mini_specunit'                 # The goods! Force MiniTest::Spec instead of MiniTest::Unit.
  gem 'mini_backtrace'                # Use Rails.backtrace_cleaner with MiniTest.
  gem 'mini_shoulda'                  # A small Shoulda syntax on top of MiniTest::Spec.
  gem 'mocha'                         # For the occasional black box test.
  # gem 'simplecov', :require => false  # Test coverage in Ruby 1.9
  gem 'guard-minitest', git: 'git://github.com/guard/guard-minitest.git'
  gem 'guard-livereload', :require=>false
  gem 'guard-bundler'
  gem 'guard-jasmine'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'spork', git: 'https://github.com/sporkrb/spork.git' #'~> 0.9.0.rc9'
  gem 'guard-spork'
  gem 'spork-testunit', git: 'git://github.com/sporkrb/spork-testunit.git'
  gem 'ruby-prof' # needed to make Spork run on Minitest?
end

group :production do
  gem 'syslogger'
end
