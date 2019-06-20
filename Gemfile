source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'devise'
gem 'omniauth-twitter'
gem 'dotenv-rails'
gem 'carrierwave'
gem 'rmagick', '~> 2.16'
gem "fog-aws"
gem 'cancancan'
gem 'kaminari'
gem 'ckeditor', '4.1.3'
gem 'mini_magick'
gem 'public_activity'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3',      '1.3.13'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :production do 
  gem 'pg', '1.1.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
