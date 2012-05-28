task :configure do
  cp "#{Rails.root}/config/database.yml.example", "#{Rails.root}/config/database.yml"
  cp "#{Rails.root}/config/facebook.yml.example", "#{Rails.root}/config/facebook.yml"
  cp "#{Rails.root}/config/deploy.rb.example", "#{Rails.root}/config/deploy.rb"

  puts "Edit the YAML files and `deploy.rb` in #{Rails.root}/config to get started."
  puts "Sample configuration for Unicorn and Thin have also been provided."
end
