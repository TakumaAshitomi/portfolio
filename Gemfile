# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.3"

gem "rails", "~> 5.2.2"
gem "puma", "~> 3.12"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap", "~> 4.3.1"
gem "jquery-rails"
gem "devise", ">= 4.7.1"
gem "dotenv-rails"
gem "carrierwave"
gem "rmagick", "~> 2.16"
gem "fog-aws"
gem "cancancan"
gem "kaminari"
gem "ckeditor", github: "galetahub/ckeditor"
gem "mini_magick", ">= 4.9.4"
gem "public_activity"
gem "faker"
gem "ransack"
gem "pg", "1.1.4"
gem "acts-as-taggable-on", "~> 6.0"
gem "nokogiri", ">= 1.10.4"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "webdrivers"
  gem "rspec-rails", "~> 3.8"
  gem "factory_bot_rails"
  gem "spring-commands-rspec"
  gem "rubocop"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
