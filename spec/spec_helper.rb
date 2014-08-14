# Encoding: utf-8
require 'chefspec'
require 'chefspec/berkshelf'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version = '12.04'
end
