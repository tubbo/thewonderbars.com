require 'env_file'

namespace :test do
  desc "Encrypt credentials for the testing environment on CI"
  task :credentials => :environment do
    project = 'tubbo/thewonderbars.com'
    env = EnvFile.new "#{Rails.root}/.env"

    env.exports do |key,value|
      sh "travis encrypt #{project} '#{key}=#{value}'"
    end
  end
end
