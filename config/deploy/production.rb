#############################################################
#	Application
#############################################################

set :application, "match_test"
set :deploy_to, "/home/deploy/apps/#{application}"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true
set :rails_env, "production" 

#############################################################
#	Servers
#############################################################

set :user, "deploy"
set :domain, "64.22.124.33"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "master"
set :scm_user, 'deploy'
set :scm_passphrase, "gumby1234"
set :repository, "git@github.com:mwise/matchtest.git"
set :deploy_via, :remote_cache

#############################################################
#	Mongrel
#############################################################

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"


namespace :deploy do
  namespace :mongrel do
    [ :stop, :start, :restart ].each do |t|
      desc "#{t.to_s.capitalize} the mongrel appserver"
      task t, :roles => :app do
        #invoke_command checks the use_sudo variable to determine how to run the mongrel_rails command
        invoke_command "mongrel_rails cluster::#{t.to_s} -C #{mongrel_conf}", :via => run_method
      end
    end
  end

  desc "Custom restart task for mongrel cluster"
  task :restart, :roles => :app, :except => { :no_release => true } do
    deploy.mongrel.restart
  end

  desc "Custom start task for mongrel cluster"
  task :start, :roles => :app do
    deploy.mongrel.start
  end

  desc "Custom stop task for mongrel cluster"
  task :stop, :roles => :app do
    deploy.mongrel.stop
  end
end

#move over the config files after deploy
task :update_config, :roles => [:app] do
  run "cp -Rf #{shared_path}/system/config/* #{release_path}/config"
end

after 'deploy:update_code', :update_config
after 'deploy:update_code', 'deploy:cleanup'
after 'deploy:symlink', 'symlink_public'

set :app_symlinks, %w( paintings slides)

desc "Symlinks the :app_symlinks directories from current/public to shared/public"
task :symlink_public, :roles => [:app, :web] do
  if app_symlinks
    app_symlinks.each do |link|
      run "ln -nfs #{shared_path}/public/#{link} #{release_path}/public/#{link}"
    end
  end
end
