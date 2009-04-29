module Trample
  class Session
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
        RestClient.send(page.request_method, page.url)
      end
  end
end
