namespace :heroku do
  desc "Configures Facebook on the Heroku dev environment"
  task :configure => :environment do
    vars = %w(app_id secret_key page_id).reduce("") do |str,opt|
      key = "FB_#{opt.upcase}"
      val = Facebook.config[opt]
      str += "#{key}=#{val} "
    end

    vars.strip!
    sh "bundle exec heroku config:add #{vars} RAILS_ENV=staging"
  end

end
