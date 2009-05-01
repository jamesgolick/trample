require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  context "Configuration trample" do
    setup do
      @config = Trample::Configuration.new do
        concurrency 2
        iterations  1
        get "http://google.com/"
      end
    end

    should "set concurrency" do
      assert_equal 2, @config.concurrency
    end

    should "set iterations" do
      assert_equal 1, @config.iterations
    end

    should "add get requests to an array of pages" do
      assert_equal 1, @config.pages.length
      assert_equal Trample::Page.new(:get, "http://google.com/"), @config.pages.first
    end

    should "be equal if all the objects are the same" do
      identical_config = Trample::Configuration.new do
        concurrency 2
        iterations  1
        get "http://google.com/"
      end
      assert_equal identical_config, @config
    end

    should "not be equal if any of the objects are different" do
      non_identical_config = Trample::Configuration.new do
        concurrency 3
        iterations  1
        get "http://google.com/"
      end
      assert_not_equal non_identical_config, @config
    end
  end
end

