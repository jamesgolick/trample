module Trample
  class Session
    include Logging
    include Timer

    attr_reader :config, :response_times, :cookies, :last_response, :page_requests

    def initialize(config)
      @config         = config
      @response_times = []
      @cookies        = {}
      @page_requests  = []
    end

    def trample
      hit @config.login unless @config.login.nil?
      @config.iterations.times do
        @config.pages.each do |p|
          hit p
        end
      end
    end

    def replay
      unless page_requests.empty?
        @cookies = {}

        page_requests.each do |page_request|
          page_request.cookies = @cookies
          response = page_request.hit
          @cookies.merge(response.cookies)
        end
      end
    end

    protected
      def hit(page)
        response_times << request(page)
        # this is ugly, but it's the only way that I could get the test to pass
        # because rr keeps a reference to the arguments, not a copy. ah well.
        @cookies = cookies.merge(last_response.cookies)
        logger.info "#{page.request_method.to_s.upcase} #{page.url} #{response_times.last}s #{last_response.code}"
      end

      def request(page)
        time do
          request = PageRequest.new(page, cookies)
          @page_requests << request
          @last_response = request.hit
        end
      end
  end
end
