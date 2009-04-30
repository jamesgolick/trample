require 'test_helper'

class RunnerTest < Test::Unit::TestCase
  def setup
    @config = Trample::Configuration.new { |t| t.concurrency 2 }
  end

  context "Running a trample" do
    setup do
      @runner = Trample::Runner.new(@config)
      @runner.trample
    end

    before_should "spawn <concurrency> threads" do
      mock.proxy(Thread).new(@config).times(2)
    end

    before_should "start <concurrency> sessions trampling" do
      stub.proxy(Trample::Session).new(@config).times(2) do |s|
        mock(s).trample
        s
      end
    end
  end
end
