module Trample
  class Session
    include Logging

    attr_reader :config

    def initialize(config)
      @config = config
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
        logger.info "#{page.request_method.to_s.upcase} #{page.url}"
        RestClient.send(page.request_method, page.url)
      end
  end
end
