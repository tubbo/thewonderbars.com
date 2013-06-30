namespace :test do
  desc "Configure the test environment"
  task :config => :environment do
    path = "#{Rails.root}/config/facebook.yml"
    cp "#{path}.example", path unless File.exists? path
  end
end
