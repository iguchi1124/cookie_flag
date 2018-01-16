require 'cookie_flag/helper'

module CookieFlag
  class Railtie < Rails::Railtie
    config.action_dispatch.rescue_responses.merge!('CookieFlag::UnavailableError' => :not_found)

    initializer 'cookie_flag' do
      ActiveSupport.on_load(:action_controller) do
        include CookieFlag::Helper if to_s != 'ActionController::API'
      end
    end
  end
end
