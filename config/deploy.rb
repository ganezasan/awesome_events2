# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'awesome_events'
set :repo_url, 'git@github.com:ganezasan/awesome_events2.git'

set :deploy_to, '/var/www/awesome-events'
set :scm, :git

set :keep_releases, 5

#set :default_env, {
#  rbenv_root: "/usr/local/rbenv",
#  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH"
#}
#set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :rbenv_path, "/usr/local/rbenv"
set :rbenv_type, :vagrant # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.2'
set :rails_env, :staging
set :rbenv_prefix, "RAILS_ENV=#{fetch(:rails_env)} RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

#set :linked_dirs, (fetch(:linked_dirs) + ['tmp/pids'])
#set :linked_dirs, (fetch(:linked_dirs) + ['tmp/sockets'])
#set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}


#set :unicorn_rack_env, ""
set :unicorn_config_path, 'config/unicorn.rb'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
