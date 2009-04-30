require 'log4r'
require 'rest_client'

module Trample
  autoload :Configuration, File.dirname(__FILE__) + "/trample/configuration"
  autoload :Page, File.dirname(__FILE__) + "/trample/page"
  autoload :Session, File.dirname(__FILE__) + "/trample/session"
  autoload :Runner, File.dirname(__FILE__) + "/trample/runner"
  autoload :Cli, File.dirname(__FILE__) + "/trample/cli"
  autoload :Logging, File.dirname(__FILE__) + "/trample/logging"
  autoload :Timer, File.dirname(__FILE__) + "/trample/timer"

  class << self
    attr_reader :current_configuration

    def configure(&block)
      @current_configuration = Configuration.new(&block)
    end
  end
end

