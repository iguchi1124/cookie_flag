require 'cookie_flag/helper'

module CookieFlag
  class Railtie < Rails::Railtie
    config.action_dispatch.rescue_responses.merge!('CookieFlag::UnavailableError' => :not_found)

    initializer 'cookie_flag' do
      ActiveSupport.on_load(:action_controller) { include CookieFlag::Helper }
    end
  end
end
