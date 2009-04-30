require 'thor'

module Trample
  class Cli < Thor
    desc "start path/to/config/file", "Start trampling"
    def start(config)
      load(config)
      Runner.new(Trample.current_configuration).trample
    end
  end
end

