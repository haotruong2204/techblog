set :stage, :production
set :rails_env, :production
set :rack_env, :production
set :branch, 'main'
set :deploy_to, '/var/www/techblog'

server "52.220.154.42", user: "ubuntu", roles: %w(web app db)
