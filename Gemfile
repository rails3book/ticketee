source 'http://rubygems.org'

gem 'rails', '3.1.0.rc6'

gem 'sqlite3'

gem 'sass', '~> 3.1.0.rc6'
gem 'coffee-rails'

gem 'dynamic_form'

gem 'devise', '1.4.2'
gem 'cancan'

gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"

gem 'searcher'
gem 'kaminari'

gem 'jquery-rails'
gem "oa-oauth", :require => "omniauth/oauth"
gem "delayed_job"

# gem "forem", :git => "git://github.com/radar/forem"
gem "ticketee-forem", :require => "forem", :path => "../forem"

gem 'sinatra'

group :test, :development do
  gem 'gmail'
  gem 'rspec-rails', '~> 2.6'
end

group :test do
  gem 'rack-test', :git => "git://github.com/radar/rack-test"
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
