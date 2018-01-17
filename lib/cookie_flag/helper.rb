require 'cookie_flag/unavailable_error'

module CookieFlag
  module Helper
    extend ActiveSupport::Concern

    included do
      helper_method :feature_available?
    end

    module ClassMethods
      def feature(feature_name)
        before_action -> {
          unless feature_available?(feature_name)
            raise UnavailableError
          end
        }
      end
    end

    private

    def feature_available?(feature_name)
      feature_flags[feature_name].present? &&
        cookies.has_key?(feature_name) &&
        cookies[feature_name] == feature_flags[feature_name]
    end

    def feature_flags
      @feature_flags ||= Rails.application.config_for(CookieFlag.config.name).with_indifferent_access
    end
  end
end
