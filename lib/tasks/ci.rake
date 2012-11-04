require 'fileutils'

namespace :ci do
  desc "Configure the application in 'dummy' mode for CI."
  task :configure => :environment do
    include FileUtils

    cp "#{Rails.root}/config/database.yml.example", "#{Rails.root}/config/database.yml"
    cp "#{Rails.root}/config/facebook.yml.example", "#{Rails.root}/config/facebook.yml"
  end
end
