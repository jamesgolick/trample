module Trample
  class Configuration
    def initialize
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
  end
end
