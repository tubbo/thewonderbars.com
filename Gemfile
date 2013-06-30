source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.0'
gem 'rake', require: false
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
gem 'bootstrap-sass'
gem 'carrierwave'
gem 'fog'

group :assets do
  gem 'sass-rails',   '~> 4.0'
  gem 'coffee-rails', '~> 4.0'
  gem 'uglifier', '~> 1.3'
  gem 'therubyracer', platform: :ruby
end

group :test do
  gem 'vcr'
  gem 'rspec-rails'
  gem 'capybara'
end

group :test, :development do
  gem 'pry-rails'
end

group :production do
  gem 'airbrake'
end
