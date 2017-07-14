source 'http://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 4.2.1'
gem 'pg', '0.20'
gem 'hashie-forbidden_attributes'
gem 'slim-rails'
gem 'dotenv-rails'

gem 'activeadmin', github: 'activeadmin'
gem 'acts_as_list'
gem 'active_admin-sortable_tree'
gem 'devise', '~> 3.4.1'
gem 'jquery-ui-rails'

gem 'grape'
gem 'grape-rabl'
gem 'grape-kaminari'
gem 'kaminari-grape'

gem 'grape-rails-cache'
gem 'dalli-elasticache'

gem 'debian-control-parser', github: 'skydan/debian-control-parser-gem'
gem 'sj-plist', github: 'eni9889/plist'
gem 'CFPropertyList'

gem 'aws-sdk', '~> 2.0.30'

gem 'rest-client'
gem 'koala'

gem 'sidekiq'
gem 'sidekiq-status'
gem 'sidekiq-cron'
gem 'sidekiq-failures'

gem 'sinatra'

gem 'foreman'
gem 'unicorn'

gem 'slack-notifier', require: false
gem 'rollbar', '~> 1.5.1'

group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'sprockets', '~> 2.12.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:ruby_22]
  gem 'spring'
  gem 'thin'
  gem 'quiet_assets'
  gem 'bullet'
  gem 'rack-mini-profiler'
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-sidekiq'
  gem 'airbrussh', :require => false

  gem 'ruby-debug-ide',    require: false
  gem 'debase',            require: false
  gem 'terminal-notifier', require: false
end

group :development, :test do
  gem 'rspec', '~> 3.1'
  gem 'rspec-rails', '~> 3.1'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'webmock', require: false
  gem 'faker'
end
