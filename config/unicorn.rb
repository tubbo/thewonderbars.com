##
# Unicorn config at <%= @name %>
# Managed by Chef - Local Changes will be Nuked from Orbit (just to be sure)
##

pid_file = "/mnt/deploy/elocal_web/shared/pids/unicorn.pid"

# What ports/sockets to listen on, and what options for them.
listen "/tmp/unicorn.elocal_web.socket", backlog: 64

working_directory "/mnt/deploy/elocal_web/current"
 
# What the timeout for killing busy workers is, in seconds
timeout 60
 
# Whether the app should be pre-loaded
preload_app false
 
# How many worker processes
worker_processes 4

# What to do before we fork a worker
before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{pid_file}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

# What to do after we fork a worker
after_fork do |server, worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end

# Where to drop a pidfile
pid pid_file

# Where stderr gets logged
stderr_path "/mnt/deploy/elocal_web/shared/log/unicorn.error.log" 

# Where stdout gets logged
stdout_path "/mnt/deploy/elocal_web/shared/log/unicorn.out.log"
