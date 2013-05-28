set :application, "giluga"

set :scm, "git"
set :scm_user, "yueli"
set :branch, "master"
set :repository,  "https://github.com/yueli/giluga.git"

ssh_options[:forward_agent] = true                    # use the ssh keys from your local account

set :deploy_via, :remote_cache

# You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/var/www/html"

set :user, "li"
set :use_sudo, false

load 'deploy/assets'                                   # get asset precompile behavior

require "bundler/capistrano" 

#role :web, "li@172.17.152.19"                          # Your HTTP server, Apache/etc
#role :app, "li@172.17.152.19"                          # This may be the same as your `Web` server
#role :db,  "li@172.17.152.19", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

server "li@172.17.152.19", :app, :web, :db, :primary => true

# if you want to clean up old releases on each deploy uncomment this:
set :keep_releases, 5
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# set :rails_env, "staging"  # By default it run migrations against your production db

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end