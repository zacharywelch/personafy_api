set :application, 'personafy_api'
set :repo_url, 'git@github.com:zacharywelch/personafy_api.git'

set :deploy_to, '/home/ubuntu/personafy_api'
set :rvm_type, :user

set :rvm_ruby_version, '2.2.3'

set :linked_files, %w{config/database.yml config/secrets.yml config/newrelic.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
  after 'deploy:updated', 'newrelic:notice_deployment'

end
