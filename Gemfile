source 'https://rubygems.org'

group :framework do
  gem 'rails', '3.2.3'
  gem 'pg'
  gem 'unicorn'
  gem 'capistrano'
  gem 'jquery-rails'
  gem 'haml'
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
  gem 'minitest'
  gem 'minitest_spec'
  gem 'mini_shoulda'

  gem 'guard-minitest', git: 'git://github.com/guard/guard-minitest.git'
  gem 'guard-bundler'
  gem 'rb-fsevent'
  gem 'growl'

  gem 'spork', git: 'https://github.com/sporkrb/spork.git' #'~> 0.9.0.rc9'
  gem 'guard-spork'
  gem 'spork-testunit', git: 'git://github.com/sporkrb/spork-testunit.git'
  gem 'ruby-prof' # needed to make Spork run on Minitest?

  gem 'vcr'
  gem 'webmock'
  gem 'mocha'
end

group :production do
  gem 'syslogger'
end
