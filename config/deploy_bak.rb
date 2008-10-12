set :application, "lindsaywalt.net"
set :repository,  "deploy@64.22.124.33:/var/git/lindsaywalt.net"
set :domain, "64.22.124.33"
set :deploy_to, "/home/deploy/apps/#{application}" # defaults to "/u/apps/#{application}"

set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"

set :scm, :git
set :scm_password, "gumby1234"
set :deploy_via, :remote_cache

default_run_options[:pty] = true #PROMPTS FOR PASSWORD LIKE CAP 1
set :keep_releases, 2

set :user, 'deploy'
set :runner, 'deploy'
set :use_sudo, false

role :app, domain
role :web, domain
role :db,  domain, :primary => true

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