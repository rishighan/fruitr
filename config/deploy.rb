require 'bundler/capistrano'

set :application, "fruitr"

set :keep_releases, 1

set :scm, :git
set :scm_username, "root"
set :scm_password, Proc.new {CLI.password_prompt "Password: "}
set :repository, "git@github.com:rishighan/fruitr.git"
set :branch, "master"
set :rails_env, "production"
set :deploy_via, :remote_cache
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :server, :passenger
set :user, "rishigha"
set :server_name, "rishighan.com"
server "rishighan.com", :app, :web, :db, :primary => true 

# ==============================
# Bundler
# ==============================
namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end
 
  task :bundle_new_release, :roles => :app do
    bundler.create_symlink
    run "cd #{release_path} && bundle install --without test"
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

###### There is no need to edit anything below this line ######
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false
#set :group_writable, false
default_run_options[:pty] = true 

role :app, server_name
role :web, server_name
role :db,  server_name, :primary => true

# set the proper permission of the public folder
task :after_update_code, :roles => [:web, :db, :app] do
  run "chmod 755 #{release_path}/public"
end



namespace :deploy do
  desc "restart passenger"
  task :restart do
    passenger::restart
  end
end



namespace :passenger do
  desc "Restart dispatchers"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

 
 
 