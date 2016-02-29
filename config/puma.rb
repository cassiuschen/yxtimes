# First, you need to change these below to your situation.
APP_ROOT = '/var/web/yxtimes'

# Second, you can choose how many threads that you are going to run at same time.
if ENV["RAILS_ENV"] == 'production'
	workers 4
	threads 4,8
else
	workers 2
	threads 2,4
end

# Unless you know what you are changing, do not change them.
bind  "unix://#{APP_ROOT}/tmp/sockets/puma.sock"
stdout_redirect "#{APP_ROOT}/log/puma.log","#{APP_ROOT}/log/puma.err.log"
pidfile "#{APP_ROOT}/tmp/pids/puma.pid"
state_path "#{APP_ROOT}/tmp/pids/puma.state"
daemonize true
activate_control_app
preload_app!
