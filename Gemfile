source 'https://rubygems.org'

gem 'rails', '3.2.13'
gem 'pg'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'bootstrap-sass', '~> 2.3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem "kaminari", "~> 0.14.1"


group :development do
  gem 'annotate'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify'
  gem 'fuubar'
end

group :development, :test do
  gem "rspec-rails", "~> 2.14"
end

group :test do
  gem 'database_cleaner'
  gem "shoulda-matchers", "~> 2.2.0"
  gem "capybara"
end  


gem 'heroku'


# Deploy with Capistrano
# gem 'capistrano'
