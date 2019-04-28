require 'rails'

module CookieFlag
  class Console < ::Rails::Engine
    isolate_namespace CookieFlag
  end
end
