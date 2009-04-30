require 'test_helper'

class LoggingTest < Test::Unit::TestCase
  context "The logging module" do
    setup do
      @object = Class.new do
        include Trample::Logging
      end.new
      @object.send(:init_logger)
    end

    should "return Log4r::Logger['main'] for #logger" do
      assert_equal Log4r::Logger['main'], @object.logger
    end
  end
end
