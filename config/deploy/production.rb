server '52.24.88.248', user: 'deploy', roles: %w{app db web}, port: 22032

rvm_ruby_version = "ruby-2.1.2@triplec_app"

set :rvm_type, :system
set :rvm_ruby_version, rvm_ruby_version
set :branch, 'master'
