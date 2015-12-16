lock '3.4.0'

set :application, 'triple_c'
set :repo_url, 'git@github.com:MightySpicyCollective/TripleC-Application.git'
set :deploy_to, '/var/www/triple_c'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/thinking_sphinx.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :keep_releases, 10
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :passenger_restart_with_touch, true

namespace :deploy do
  task :restart do
    on roles(:web), :in => :sequence, :wait => 5 do
      execute :mkdir, '-p', "#{ release_path }/tmp"
    end
  end
end
