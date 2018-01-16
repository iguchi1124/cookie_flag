module CookieFlag
  class Configuration
    attr_accessor :file_name

    def initialize
      @file_name = 'cookie_flag'
    end
  end
end
