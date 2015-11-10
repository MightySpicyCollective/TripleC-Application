# TripleC-Application

### Setup Instructions

This is the Ruby on Rails application, so following step would help you in installing the app on your system.

We assume that you are running Ubuntu or Mac OSX.

- Install ruby. You can install it via [RVM](https://rvm.io/).
- Install Ruby version `2.1.2`. Use `rvm install 2.1.2` to install it.
- Install ruby system gems like `bundler`, `rack` and `rake`.
  - `sudo gem install bundler`
  - `sudo gem install rack`
  - `sudo gem install rake`
- The system uses PostgreSQL database so we need to install it too.
  - `brew install postgres` for Mac OSX
  - `sudo apt-get install postgresql postgresql-contrib` for Ubuntu
- Clone the application on your system.
- change directory (`cd`) into the folder where the app is cloned and run `bundle install`.
- Copy the contents from `database.yml.example` to `database.yml` and fill in the contents according to your system.
- Copy the contents from `secrets.yml.example` to `secrets.yml` and fill in the value of the `secret_key_base` by running `rake secret` command.
- Finally run `rails server` in the command line.
- Open any web browser and visit `localhost:3000` to get started.
