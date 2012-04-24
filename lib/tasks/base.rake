task :configure do
  cp "#{Rails.root}/config/database.yml.example", "#{Rails.root}/config/database.yml"
  cp "#{Rails.root}/config/facebook.yml.example", "#{Rails.root}/config/facebook.yml"
  puts "Edit the YAML files in #{Rails.root}/config to get started."
end
