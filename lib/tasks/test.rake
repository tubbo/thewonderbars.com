require 'env_file'

namespace :test do
  desc "Configure the test environment"
  task :config => :environment do
    path = "#{Rails.root}/config/facebook.yml"
    cp "#{path}.example", path unless File.exists? path
  end

  desc "Load in credentials for CI testing environment"
  task :credentials => :environment do
    project = 'tubbo/thewonderbars.com'

    EnvFile.read :exports do |key,value|
      sh "travis encrypt #{project} '#{key}=#{value}'"
    end
  end
end
