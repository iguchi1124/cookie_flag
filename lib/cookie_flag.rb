require 'cookie_flag/configuration'
require 'cookie_flag/console'
require 'cookie_flag/railtie'
require "cookie_flag/version"

module CookieFlag
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield config
    end
  end
end
