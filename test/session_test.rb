require 'test_helper'

class SessionTest < Test::Unit::TestCase
  def setup
    @config = Trample::Configuration.new do |t|
      t.iterations 2
      t.get("http://google.com/")
      t.get("http://amazon.com/")
    end
    @session = Trample::Session.new(@config)
  end

  context "Starting a trample session" do
    setup do
      @session.trample
    end

    before_should "visit the pages iterations times each" do
      mock(RestClient).get("http://google.com/").times(2)
      mock(RestClient).get("http://amazon.com/").times(2)
    end
  end

  context "Visiting a page" do
    setup do
      stub(@session).time { 1.4 }
      @session.trample
    end

    should "record the length of tiem it took to visit that page" do
      assert_equal [1.4, 1.4, 1.4, 1.4], @session.response_times
    end
  end
end

