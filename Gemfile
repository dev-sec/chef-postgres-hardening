# encoding: utf-8

source 'https://rubygems.org'

gem 'berkshelf', '~> 5.3'
gem 'chef', '~> 12.5'

# pin dependency for Ruby 1.9.3 since bundler is not
# detecting that net-ssh 3 does not work with 1.9.3
if Gem::Version.new(RUBY_VERSION) <= Gem::Version.new('1.9.3')
  gem 'net-ssh', '~> 2.9'
end

group :test do
  gem 'bundler', '~> 1.5'
  gem 'chefspec',   '~> 5.3.0'
  gem 'coveralls',  require: false
  gem 'foodcritic', '~> 6.0'
  gem 'minitest', '~> 5.5'
  gem 'rake'
  gem 'rubocop', '~> 0.46.0'
  gem 'simplecov', '~> 0.10'
end

group :development do
  gem 'guard'
  gem 'guard-foodcritic'
  gem 'guard-kitchen'
  gem 'guard-rspec'
  gem 'guard-rubocop'
end

group :integration do
  gem 'concurrent-ruby', '~> 0.9'
  gem 'kitchen-dokken'
  gem 'kitchen-inspec', '~> 0.9'
  gem 'kitchen-vagrant'
  gem 'test-kitchen', '~> 1.0'
end

group :tools do
  gem 'github_changelog_generator', '~> 1.12.0'
end
