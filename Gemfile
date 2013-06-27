source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'
gem 'blue_velvet', '~> 1.0'
gem 'airbrake'
gem 'high_voltage'

group :views do
  gem 'haml-rails'
  gem 'haml'
  gem 'jquery-rails'
  gem 'redcarpet'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer', platform: :ruby
  gem 'bootstrap-sass', '~> 2.0.2'
end

group :development do
  gem 'thin', require: false
  gem 'heroku', require: false
  gem 'jammit', require: false
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'turn', '>= 0.9.3'
  gem 'minitest'
  gem 'mini_specunit'
  gem 'mini_shoulda'
  gem 'factory_girl_rails'
end

group :stage do
  gem 'thin'
end

group :production do
  gem 'syslogger'
  gem 'unicorn'
end
