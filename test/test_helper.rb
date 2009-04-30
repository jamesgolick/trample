require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rr'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'trample'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit unless include?(RR::Adapters::TestUnit)

  protected
  def trample(config)
    Trample::Cli.new.start(config)
  end

  def mock_get(url, opts={})
    mock(RestClient).get(url, :cookies => opts[:cookies] || {}).times(opts[:times]) do
      response = RestClient::Response.new("", stub!)
      stub(response).cookies { opts[:return_cookies] || {} }
    end
  end
end

