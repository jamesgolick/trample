require 'test_helper'

class TimerTest < Test::Unit::TestCase
  context "Timing the execution of a block" do
    setup do
      now         = Time.now
      invocations = 0
      stub(Time).now do
        invocations += 1
        # not sure why we have to start at 1, 
        # but this seems to get called somewhere
        invocations == 2 ? now : (now + 1.5) 
      end

      @obj = Class.new { include Trample::Timer }.new
    end

    should "return the amount of time elapsed while the block was run" do
      assert_equal(1.5, @obj.time {})
    end
  end
end

