require 'env_file'

namespace :test do
  desc "Configure the testing environment on CI"
  task :config => :environment do
    path = "#{Rails.root}/config/facebook.yml"
    cp "#{path}.example", path unless File.exists? path
  end

  desc "Encrypt credentials for the testing environment on CI"
  task :credentials => :environment do
    project = 'tubbo/thewonderbars.com'
    env = EnvFile.new "#{Rails.root}/.env"

    env.exports do |key,value|
      require 'debug';debugger
      sh "travis encrypt #{project} '#{key}=#{value}'"
    end
  end
end
