require 'bundler'
Bundler.setup :default, :deployment
Bundler.require :deployment

set :user, "necromancer"
set :domain, "psychedeli.ca"
set :use_sudo, true
set :application, "wonderbars"
set :deploy_to, "/home/#{user}/src/#{application}"
set :repository,  "git@github.com:tubbo/thewonderbars.com.git"
set :scm, :git

role :app, "psychedeli.ca"
#role :app, "thewonderbars.com"
#role :db,  "thewonderbars.com", :primary => true

set :rvm_ruby_string, '1.9.3-p125@wonderbars'
set :rvm_type, :user

require 'rvm/capistrano'

server domain, :web

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :bundle do
    run "cd #{release_path}; bundle install"
  end
  task :link_configuration do
    run "ln -s #{shared_path}/config/unicorn.rb #{release_path}/config/unicorn.rb"
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -s #{shared_path}/config/facebook.yml #{release_path}/config/facebook.yml"
  end
  task :restart do
    run "cd #{release_path}; touch tmp/restart.txt"
  end
end

namespace :unicorn do
  desc 'Start Unicorn'
  task :start, :roles => :app, :except => {:no_release => true} do
    if remote_file_exists?(unicorn_pid)
      if process_exists?(unicorn_pid)
        logger.important("Unicorn is already running!", "Unicorn")
        next
      else
        run "rm #{unicorn_pid}"
      end
    end

    config_path = "#{current_path}/config/unicorn.rb"
    if remote_file_exists?(config_path)
      logger.important("Starting...", "Unicorn")
      run "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn -E #{rails_env} -c #{config_path} -D"
    else
      logger.important("Config file for unicorn was not found at \"#{config_path}\"", "Unicorn")
    end
  end

  desc 'Stop Unicorn'
  task :stop, :roles => :app, :except => {:no_release => true} do
    if remote_file_exists?(unicorn_pid)
      if remote_process_exists?(unicorn_pid)
        logger.important("Stopping...", "Unicorn")
        run "#{try_sudo} kill `cat #{unicorn_pid}`"
      else
        run "rm #{unicorn_pid}"
        logger.important("Unicorn is not running.", "Unicorn")
      end
    else
      logger.important("No PIDs found. Check if unicorn is running.", "Unicorn")
    end
  end

  desc 'Unicorn graceful shutdown'
  task :graceful_stop, :roles => :app, :except => {:no_release => true} do
    if remote_file_exists?(unicorn_pid)
      if remote_process_exists?(unicorn_pid)
        logger.important("Stopping...", "Unicorn")
        run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
      else
        run "rm #{unicorn_pid}"
        logger.important("Unicorn is not running.", "Unicorn")
      end
    else
      logger.important("No PIDs found. Check if unicorn is running.", "Unicorn")
    end
  end

  desc 'Reload Unicorn'
  task :reload, :roles => :app, :except => {:no_release => true} do
    if remote_file_exists?(unicorn_pid)
      logger.important("Stopping...", "Unicorn")
      run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
    else
      logger.important("No PIDs found. Starting Unicorn server...", "Unicorn")
      config_path = "#{current_path}/config/unicorn.rb"
      if remote_file_exists?(config_path)
        run "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn -p 7000 -E #{rails_env} -D"
      else
        logger.important("Config file for unicorn was not found at \"#{config_path}\"", "Unicorn")
      end
    end
  end
end

def unicorn_pid
  "#{current_path}/tmp/pids/unicorn.#{application}.#{rails_env}.pid"
end

def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end

# Check if process is running
def remote_process_exists?(pid_file)
  capture("ps -p $(cat #{pid_file}) ; true").strip.split("\n").size == 2
end

before "deploy:assets:symlink", "deploy:bundle", "deploy:link_configuration"
after "deploy:restart", "unicorn:reload"

