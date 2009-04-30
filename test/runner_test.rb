require 'test_helper'

class RunnerTest < Test::Unit::TestCase
  def setup
    @config = Trample::Configuration.new do  |t| 
      t.concurrency 2 
      t.iterations  5
    end
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

    before_should "block until all the threads terminate" do
      stub.proxy(Thread).new(@config) do |t|
        mock(t).join
        t
      end
    end
  end
end
