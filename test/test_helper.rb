require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rr'
require 'fakeweb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'trample'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit unless include?(RR::Adapters::TestUnit)

  protected
  def trample(options)
    dir = File.expand_path(File.dirname(__FILE__))
    `#{dir}/../bin/trample #{options}`
  end
end

