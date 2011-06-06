source 'http://rubygems.org'

gem 'rails', '3.1.0.rc1'
# gem 'arel',      :git => 'git://github.com/rails/arel.git'
gem 'rack', :path => "~/Sites/gems/rack"
gem 'sprockets', :git => "git://github.com/sstephenson/sprockets.git"

gem 'sqlite3'

gem 'sass', '~> 3.1.0.alpha'
gem 'coffee-script'

gem 'dynamic_form'

gem 'devise', :git => "git://github.com/plataformatec/devise.git"
gem 'cancan'

gem 'paperclip'

gem 'searcher'

gem 'jquery-rails', :path => "~/Sites/gems/jquery-rails"
gem "oa-oauth", :require => "omniauth/oauth"

group :test, :development do
  gem 'gmail'
  gem 'rspec-rails', '~> 2.6.1.beta1'
end

group :test do
  gem 'rack-test', :git => "git://github.com/radar/rack-test"
  gem 'cucumber-rails', :git => "git://github.com/cucumber/cucumber-rails"
  gem 'capybara', :git => "git://github.com/radar/capybara"
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
end

group :production do
  gem 'pg'
end
