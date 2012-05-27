source 'https://rubygems.org'

group :framework do
  gem 'rails', '3.2.3'
  gem 'pg'
  gem 'jquery-rails'
  gem 'debugger'
  gem 'redcarpet'
end

gem 'haml'
gem 'haml-rails'

group :deployment do
  gem 'capistrano'
  gem 'rvm'
  gem 'rvm-capistrano', require: false
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', platform: :ruby
  gem 'bootstrap-sass', '~> 2.0.2'
  gem 'sproutcore-rails'
end

group :communication do
  gem 'koala'
  gem 'soundcloud'
end

group :development do
  gem 'thin'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'turn', '>= 0.9.3'
  gem 'minitest'                      # At least v2.0.2 if using MiniShoulda.
  gem 'mini_specunit'                 # The goods! Force MiniTest::Spec instead of MiniTest::Unit.
  gem 'mini_backtrace'                # Use Rails.backtrace_cleaner with MiniTest.
  gem 'mini_shoulda'                  # A small Shoulda syntax on top of MiniTest::Spec.
  gem 'mocha'                         # For the occasional black box test.
  # gem 'simplecov', :require => false  # Test coverage in Ruby 1.9
  gem 'guard-minitest', git: 'git://github.com/guard/guard-minitest.git'
  gem 'guard-livereload', require: false
  gem 'guard-bundler', require: false
  gem 'guard-jasmine', require: false
  gem 'rb-fsevent', require: false
  gem 'growl', require: false
  gem 'spork', git: 'https://github.com/sporkrb/spork.git' #'~> 0.9.0.rc9'
  gem 'guard-spork', require: false
  gem 'spork-testunit', git: 'git://github.com/sporkrb/spork-testunit.git'
  gem 'ruby-prof', require: false # needed to make Spork run on Minitest?
end

group :production do
  gem 'syslogger'
  gem 'unicorn'
end
