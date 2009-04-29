require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  context "Configuration trample" do
    setup do
      @config = Trample::Configuration.new do |t|
        t.concurrency 2
        t.iterations  1
      end
    end

    should "set concurrency" do
      assert_equal 2, @config.concurrency
    end

    should "set iterations" do
      assert_equal 1, @config.iterations
    end
  end
end

