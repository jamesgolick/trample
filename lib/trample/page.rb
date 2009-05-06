module Trample
  class Page
    attr_reader :request_method

    def initialize(request_method, url, parameters = {})
      @request_method = request_method
      @url            = url
      @parameters     = parameters
    end

    def parameters
      proc_params? ? @parameters.call : @parameters
    end

    def ==(other)
      other.is_a?(Page) && 
        other.request_method == request_method &&
          other.url == url
    end

    def url
      proc_params? ? interpolated_url : @url
    end
    
    protected
      def proc_params?
        @parameters.is_a?(Proc)
      end

      def interpolated_url
        params = parameters # cache called proc
        url    = @url
        url.scan(/\:\w+/).each do |m|
          url.gsub!(m, params[m.gsub(/:/, '').to_sym].to_s)
        end
        url
      end
  end
end
