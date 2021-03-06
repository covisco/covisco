require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'    # for rvm support. (https://rvm.io)

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application_name, 'covisco'
set :domain, '104.131.182.163'
set :deploy_to, '/srv/app/covisco.com'
set :repository, 'https://github.com/covisco/covisco.git'
set :branch, 'master'

# Optional settings:
set :user, 'sitedeploy'    # Username in the server to SSH to.
set :ssh_options, '-A'
set :forward_agent, true     # SSH forward_agent.

# For system-wide RVM install.
set :rvm_use_path, '/usr/local/rvm/bin/rvm'

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
set :shared_dirs, fetch(:shared_dirs, []).push('config/database.yml', 'log')
set :shared_files, fetch(:shared_files, []).push('config/secrets.yml')

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', 'ruby-2.2.0'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:current_path)}/log"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:current_path)}/log"]

  command %[mkdir -p "#{fetch(:deploy_to)}/#{fetch(:current_path)}/config"]
  command %[chmod g+rx,u+rwx "#{fetch(:deploy_to)}/#{fetch(:current_path)}/config"]

  command %[touch "#{fetch(:deploy_to)}/#{fetch(:current_path)}/config/database.yml"]
  command  %[echo "-----> Be sure to edit '#{fetch(:deploy_to)}/#{fetch(:current_path)}/config/database.yml'."]

  command %[touch "#{fetch(:deploy_to)}/#{fetch(:current_path)}/config/secrets.yml"]
  command  %[echo "-----> Be sure to edit '#{fetch(:deploy_to)}/#{fetch(:current_path)}/config/secrets.yml'."]
end

desc "Deploys the current version to the server."
task :deploy do
  # uncomment this line to make sure you pushed your local branch to the remote origin
  # invoke :'git:ensure_pushed'
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
    end
  end

  # you can use `run :local` to run tasks on local machine before of after the deploy scripts
  # run(:local){ say 'done' }
end

# For help in making your deploy script, see the Mina documentation:
#
#  - https://github.com/mina-deploy/mina/tree/master/docs
