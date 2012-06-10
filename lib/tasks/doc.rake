# Tasks for generating all kinds of documentation
namespace :doc do
  desc "Generate CTags for every gem used in the Bundle."
  task :tags => :environment do
    if File.exists? "Gemfile"
      paths = Bundler.load.specs.map(&:full_gem_path)
      root_path = File.dirname __FILE__
      system "ctags -R -f #{root_path}/tags #{paths.join(' ')} #{root_path}"
      puts "Your bundle's tag file has been built." if File.exists? 'tags'
    else
      puts "Error: Gemfile not found"
      puts "You can only run this in a project using Bundler."
      exit 1
    end
  end
end
