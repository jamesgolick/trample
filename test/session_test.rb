require 'test_helper'

class SessionTest < Test::Unit::TestCase
  def setup
    @config = Trample::Configuration.new do
      iterations 2
      get "http://google.com/"
      get "http://amazon.com/"
    end
    @session = Trample::Session.new(@config)
  end

  context "Starting a trample session" do
    setup do
      @session.trample
    end

    before_should "visit the pages iterations times each" do
      mock_get("http://google.com/", :times => 2)
      mock_get("http://amazon.com/", :times => 2)
    end
  end

  context "Visiting a page" do
    setup do
      stub(@session).time { 1.4 }
      stub(@session).last_response do
        response = RestClient::Response.new("", stub!)
        stub(response).cookies { {} }
      end
      @session.trample
    end

    should "record the length of time it took to visit that page" do
      assert_equal [1.4, 1.4, 1.4, 1.4], @session.response_times
    end
  end

  context "If a page responds with a cookie" do
    should "pass that cookie on to the next page" do
      stub(RestClient).get(anything, anything) do
        response = RestClient::Response.new("", stub!)
        stub(response).cookies { {"xyz" => "abc"} }
      end

      @config = Trample::Configuration.new do
        iterations 2
        get "http://amazon.com/"
      end

      @session = Trample::Session.new(@config)
      @session.trample

      assert_received(RestClient) { |c| c.get("http://amazon.com/", :cookies => {"xyz" => "abc"}) }
    end
  end
end

