source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use postgresql as the database for Active Record
#gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Authentication
gem 'devise_token_auth', :git => 'git://github.com/lynndylanhurley/devise_token_auth.git'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'

# Used to rate-limiting incoming HTTP requests
gem 'rack', '~> 2.0', '>= 2.0.1'
gem 'rack-throttle', '~> 0.5.0'

#Seed file generated using this
gem 'faker'

#Facility for attachments
gem 'carrierwave', '~> 0.11.2'
#gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'

#Pagination utility
gem 'will_paginate', '~> 3.1', '>= 3.1.5'

#Serializer
gem 'active_model_serializers', '~> 0.10.5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]