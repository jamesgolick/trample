module Trample
  class Runner
    attr_reader :config, :threads

    def initialize(config)
      @config  = config
      @threads = []
    end

    def trample
      @config.concurrency.times do
        threads << Thread.new(@config) do |c|
          Session.new(c).trample
        end
      end
    end
  end
end

