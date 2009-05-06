module Trample
  class PageRequest
    attr_accessor :url, :request_method, :cookies, :parameters

    def initialize(page, cookies={})
      @request_method = page.request_method
      @url            = page.url
      @cookies        = cookies
      @parameters     = page.parameters
    end

    def hit
      send(@request_method)
    end

    protected
      def get
        RestClient.get(url, :cookies => cookies)
      end

      def post
        RestClient.post(url, parameters, :cookies => cookies)
      end
  end
end
