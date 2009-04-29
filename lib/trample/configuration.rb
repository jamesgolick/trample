module Trample
  class Configuration
    attr_reader :pages

    def initialize
      @pages = []
      yield self
    end

    def concurrency(*value)
      @concurrency = value.first unless value.empty?
      @concurrency
    end

    def iterations(*value)
      @iterations = value.first unless value.empty?
      @iterations
    end

    def get(url)
      @pages << Page.new(:get, url)
    end
  end
end
