source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.1"

gem "active_model_serializers"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "config"
gem "devise"
gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
gem "figaro"
gem "image_processing", "~> 1.2"
gem "jbuilder", "~> 2.7"
gem "jwt"
gem "mysql2", ">= 0.4.4"
gem "puma", "~> 4.1"
gem "rack-cors"
gem "rails", "~> 6.0.3", ">= 6.0.3.3"
gem "redis", "~> 4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :development do
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
