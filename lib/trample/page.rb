module Trample
  class Page
    attr_reader :request_method, :url

    def initialize(request_method, url)
      @request_method = request_method
      @url            = url
    end
  end
end
