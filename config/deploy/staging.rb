set :stage, :staging
set :rails_env, :staging
set :rack_env, :staging
set :branch, 'main'
set :deploy_to, '/var/www/techblog'

server "52.220.154.42", user: "ubuntu", roles: %w(web app db)
