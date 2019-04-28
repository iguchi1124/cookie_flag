module CookieFlag
  class Configuration
    attr_accessor :name

    def initialize(name:)
      @name = name
    end
  end
end
