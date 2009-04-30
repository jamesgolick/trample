module Trample
  class Runner
    attr_reader :config, :threads

    def initialize(config)
      @config  = config
      @threads = []
    end

    def trample
      config.concurrency.times do
        thread = Thread.new(@config) do |c|
          Session.new(c).trample
        end
        threads << thread
      end

      threads.each { |t| t.join }
    end
  end
end

