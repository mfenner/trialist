source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'mysql2', '0.3.18'
gem "dotenv", '~> 2.1'
gem "config"
gem 'rake', '~> 10.5'
gem "whenever", "~> 0.9.0", require: false
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem "dalli", "~> 2.7.0"
gem 'will_paginate', '~> 3.1.5'
gem 'paper_trail', '~> 6.0', '>= 6.0.2'

group :development, :test do
  gem "rspec-rails", "~> 3.1.0"
  gem 'byebug', platform: :mri
  gem 'teaspoon-jasmine', '~> 2.2.0'
  gem "brakeman", "~> 2.6.0", :require => false
  gem 'rubocop', '~> 0.27.0'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "factory_girl_rails", "~> 4.5.0", :require => false
  gem "capybara", "~> 2.4.4"
  gem 'capybara-screenshot', '~> 1.0.3'
  gem "database_cleaner", "~> 1.3.0"
  gem "launchy", "~> 2.4.2"
  gem "email_spec", "~> 1.6.0"
  gem "rack-test", "~> 0.6.2", :require => "rack/test"
  gem "simplecov", "~> 0.10.0", :require => false
  gem 'codeclimate-test-reporter', '~> 0.4.8', :require => nil
  gem "shoulda-matchers", "~> 2.7.0", :require => false
  gem "webmock", "~> 1.20.0"
  gem 'vcr', '~> 2.9.3'
  gem "poltergeist", "~> 1.8.1"
  gem "with_env", "~> 1.1.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
