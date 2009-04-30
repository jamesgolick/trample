require 'test_helper'

class CliTest < Test::Unit::TestCase
  context "Running the CLI" do
    setup do
      Trample::Cli.new.start('test/fixtures/basic_config.rb')
    end

    before_should "start a trample with the current_config" do
      load('test/fixtures/basic_config.rb')
      stub.proxy(Trample::Runner).new(Trample.current_configuration) do |r|
        mock(r).trample
        r
      end
    end
  end
end
