module Trample
  class Session
    include Logging
    include Timer

    attr_reader :config, :response_times

    def initialize(config)
      @config         = config
      @response_times = []
    end

    def trample
      @config.iterations.times do
        @config.pages.each do |p|
          request p
        end
      end
    end

    protected
      def request(page)
        length = time do
          RestClient.send(page.request_method, page.url)
        end
        response_times << length
        logger.info "#{page.request_method.to_s.upcase} #{page.url} #{length}s"
      end
  end
end
