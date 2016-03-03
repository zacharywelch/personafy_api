server 'stg-personafy-api.cb.com', user: 'ubuntu', roles: %w{web app}

set :stage, :staging
set :rails_env, 'staging'
set :branch, :master
