namespace :heroku do
  desc "Load environment variables into the Heroku environment"
  task :configure do
    raise "Please edit your configuration in .env" unless File.exists? '.env'
    vars = %w(
      FB_APP_ID FB_SECRET_KEY FB_PAGE_ID
      GOOGLE_ANALYTICS_ID AIRBRAKE_API_KEY
    ).reduce("") { |str,key|
      val = ENV[key]
      str += "#{key}='#{val}' "
    }.strip

    sh "bundle exec heroku config:add #{vars} RAILS_ENV=production"
  end
end
