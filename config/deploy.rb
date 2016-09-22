require 'bundler/capistrano'
require "rvm/capistrano"

set :application, "pinterest_clone"
set :repository,  "https://github.com/stalintouch/pinterest_clone"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
load "deploy/assets"
set :scm, :git
set :branch, "master"


set :port, 3993
set :use_sudo, false

set :rails_env, :production
set :branch, "master"
set :deploy_to, "/home/deployer/pinterest"
set :user, 'deployer'
set :use_sudo, false
set :deploy_via, :copy
default_run_options[:pty] = true

role :web, "159.203.39.49"                          # Your HTTP server, Apache/etc
role :app, "159.203.39.49"                          # This may be the same as your `Web` server
role :db,  "159.203.39.49", :primary => true # This is where Rails migrations will run
