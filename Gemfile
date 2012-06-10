source 'https://rubygems.org'

group :framework do
  gem 'rails', '3.2.3'
  gem 'pg'
end

group :views do
  gem 'haml-rails'
  gem 'haml'
  gem 'jquery-rails'
  gem 'redcarpet'
end

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

group :api do
  gem 'koala'
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
  gem 'mini_shoulda'                  # A small Shoulda syntax on top of MiniTest::Spec.
  gem 'factory_girl_rails'
  gem 'guard-minitest', git: 'git://github.com/guard/guard-minitest.git'
  gem 'guard-bundler', require: false
  gem 'guard-jasmine', require: false
  gem 'rb-fsevent', require: false
  gem 'growl', require: false
end

group :production do
  gem 'syslogger'
  gem 'unicorn'
end
