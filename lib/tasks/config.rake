namespace :config do
  desc "Copy over the Facebook configuration"
  task :facebook do
    path = File.expand_path "../../../config/facebook.yml", __FILE__
    cp "#{path}.example", path unless File.exists? path
  end
end

task :config => ['config:facebook']
