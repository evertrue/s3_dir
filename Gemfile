source 'https://rubygems.org'

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'berkshelf',  '~> 3.1'
  gem 'chefspec',   '~> 4.0'
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop',    '~> 0.23'
  gem 'coveralls'
end

group :test, :integration do
  gem 'test-kitchen',    '~> 1.2'
  gem 'kitchen-ec2',     '~> 0.10'
end

group :test, :integration, :vagrant do
  gem 'kitchen-vagrant', '~> 0.14'
end
