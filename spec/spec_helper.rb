require 'dyph'

require "pry"
require "awesome_print"
require 'faker'

Dir[File.dirname(__FILE__) + '/fixtures/*.rb'].each {|file| require file }

def three_way_differs
  [Dyph::Support::Diff3]
end


def two_way_differs
  [Dyph::TwoWayDiffers::HeckelDiff]
end

RSpec.configure do |config|
  config.color = true
end
