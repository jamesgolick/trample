module Trample
  class Session
    include Logging
    include Timer

    attr_reader :config, :response_times, :cookies, :last_response

    def initialize(config)
      @config         = config
      @response_times = []
      @cookies        = {}
    end

    def trample
      @config.iterations.times do
        @config.pages.each do |p|
          hit p
        end
      end
    end

    protected
      def hit(page)
        response_times << request(page)
        # this is ugly, but it's the only way that I could get the test to pass
        # because rr keeps a reference to the arguments, not a copy. ah well.
        @cookies = cookies.merge(last_response.cookies)
        logger.info "#{page.request_method.to_s.upcase} #{page.url} #{response_times.last}s"
      end

      def request(page)
        time do
          @last_response = RestClient.send(page.request_method, page.url, :cookies => cookies)
        end
      end
  end
end
