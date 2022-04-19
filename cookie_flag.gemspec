lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cookie_flag/version"

Gem::Specification.new do |spec|
  spec.name          = "cookie_flag"
  spec.version       = CookieFlag::VERSION
  spec.author        = "Shota Iguchi"
  spec.email         = "shota-iguchi@cookpad.com"

  spec.summary       = "Cookie based feature flags implementation for Rails."
  spec.homepage      = "https://github.com/iguchi1124/cookie_flag"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activesupport", ">= 4.2"
  spec.add_development_dependency "railties", ">= 4.2"

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "rails", ">= 4.2"
  spec.add_development_dependency "rspec-rails", ">= 3.7.2"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_development_dependency "webrick"
end
