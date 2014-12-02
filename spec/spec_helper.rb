# encoding: utf-8

require 'chefspec'
require 'chefspec/berkshelf'

require 'coveralls'

# coverage report
Coveralls.wear!
at_exit { ChefSpec::Coverage.report! }
