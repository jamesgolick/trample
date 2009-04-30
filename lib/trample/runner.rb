module Trample
  class Runner
    include Logging

    attr_reader :config, :threads

    def initialize(config)
      @config  = config
      @threads = []
    end

    def trample
      logger.info "Starting trample..."

      config.concurrency.times do
        thread = Thread.new(@config) do |c|
          Session.new(c).trample
        end
        threads << thread
      end

      threads.each { |t| t.join }

      logger.info "Trample completed..."
    end
  end
end

