require 'rails'

module CookieFlag
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("../templates", __dir__)

    def install
      copy_file "cookie_flag.yml", "config/cookie_flag.yml"
    end
  end
end
