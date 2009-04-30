require 'test_helper'

class TrampleTest < Test::Unit::TestCase
  context "Configuring Trample" do
    setup do
      Trample.configure do |t|
        t.concurrency 5
        t.iterations  1
      end
    end

    should "assign the configuration to Trample.current_configuration" do
      assert_equal 5, Trample.current_configuration.concurrency
    end
  end
end
