
default_run_options[:pty] = true

ssh_options[:keys] = %w(/Users/meph/.ssh/id_rsa)

# be sure to change these
set :user, 'oflannabhra'
set :domain, 'mattmade.com'
set :application, 'cov_demo'

# the rest should be good
set :repository,  "#{user}@#{domain}:git/#{application}.git"
set :deploy_to, "/home/#{user}/#{domain}"
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :git_shallow_clone, 1
set :scm_verbose, true
set :use_sudo, false

server domain, :app, :web
role :db, domain, :primary => true

namespace :deploy do
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end