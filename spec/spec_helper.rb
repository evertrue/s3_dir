# Encoding: utf-8
require 'coveralls'

Coveralls.wear!

require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color     = true
  config.formatter = :documentation
  config.platform  = 'ubuntu'
  config.version   = '16.04'
end
