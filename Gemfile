source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
# gem 'sqlite3', '~> 1.3.6'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'tux'
gem 'faker'
gem 'rack-flash3'
# gem 'open-uri'
gem 'json'
gem 'hyperclient'
# gem 'httparty'

group :production do 
  gem 'pg', '~> 0.18'
  gem 'activerecord-postgresql-adapter'
end 

group :development, :test do 
  gem 'sqlite3'
end 

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end
