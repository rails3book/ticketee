source 'http://rubygems.org'

gem 'rails', :git => "git://github.com/rails/rails", :branch => "3-1-stable"
# gem 'arel',      :git => 'git://github.com/rails/arel.git'
gem 'rack'
gem 'sprockets', :git => "git://github.com/sstephenson/sprockets.git"

gem 'sqlite3'

gem 'sass', '~> 3.1.0.alpha'
gem 'coffee-script'

gem 'dynamic_form'

gem 'devise', :git => "git://github.com/plataformatec/devise.git"
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
  gem 'rspec-rails', '~> 2.6.1.beta1'
end

group :test do
  gem 'rack-test', :git => "git://github.com/radar/rack-test"
  gem 'cucumber-rails', :git => "git://github.com/cucumber/cucumber-rails"
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
