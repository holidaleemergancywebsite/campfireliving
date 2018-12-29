# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "campfireliving"

# add a reposity 
set :repo_url, "git@github.com:holidaleemergancywebsite/campfireliving.git"
# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :current_branch,  `git rev-parse --abbrev-ref HEAD`.strip
set :branch, ENV['BRANCH'] || fetch(:current_branch)

set :user, "webuser"
set :ssh_options, {
    user: 'webuser',
    keys: ["~/.ssh/id_rsa"]
}

server "www.campfileliving.com", :app, :web, :db, :primary => true 
# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/campfireliving"

set :keep_releases, 5
set :sidekiq_env, 'production'
set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)
set :tests, []
set :conditionally_migrate, true
set :bundle_binstubs, nil

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system public/uploads public/sitemaps public/data}
set :linked_files, %w{config/database.yml config/config.yml config/secrets.yml config/local_env.yml}


namespace :deploy do
    after :finished, :refresh_sitemap do
      on roles(:web), in: :groups, limit: 3, wait: 1 do
        if fetch(:rails_env) == 'production'
          within release_path do
            invoke "deploy:sitemap:refresh"
          end
        end
      end
    end
end

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
