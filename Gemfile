source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'pg'
gem 'blue_velvet', path: '../../Code/blue_velvet'
gem 'high_voltage'
gem 'haml-rails'
gem 'jquery-rails'
gem 'redcarpet'
gem 'thin'
gem 'hike' # i have no idea why i need this..
gem 'draper'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

group :assets do
  gem 'sass-rails',   '~> 4.0'
  gem 'coffee-rails', '~> 4.0'
  gem 'uglifier', '~> 1.3'
  gem 'therubyracer', platform: :ruby
  gem 'bootstrap-sass', '~> 2.0.2'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'spec_converter'
end

group :test, :development do
  gem 'pry-rails'
end

group :production do
  gem 'airbrake'
end
