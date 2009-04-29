require 'test_helper'

class SessionTest < Test::Unit::TestCase
  context "Starting a trample session" do
    setup do
      @config = Trample::Configuration.new do |t|
        t.iterations 2
        t.get("http://google.com/")
        t.get("http://amazon.com/")
      end
      @session = Trample::Session.new(@config)
      @session.trample
    end

    before_should "visit the pages iterations times each" do
      mock(RestClient).get("http://google.com/").times(2)
      mock(RestClient).get("http://amazon.com/").times(2)
    end
  end
end

