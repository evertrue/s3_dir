# Encoding: utf-8
require 'coveralls'

Coveralls.wear!

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.platform = 'ubuntu'
  config.version  = '16.04'
end
