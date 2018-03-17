# CookieFlag

[![Build Status](https://travis-ci.org/iguchi1124/cookie_flag.svg?branch=master)](https://travis-ci.org/iguchi1124/cookie_flag)

Cookie based feature flags implementation for Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cookie_flag'
```

And then execute:

```shell
$ bundle
$ bundle exec rails generate cookie_flag:install
```

## Usage

At first, edit your `config/cookie_flag.yml` and configure your feature flag name and feature flag secret.

```yml
default: &default
  new_feature: '1'

development:
  <<: *default

test:
  <<: *default

production:
  new_feature: <%= ENV['NEW_FEATURE_SECRET'] %>
```

then, you can use cookie based feature flag API at controllers and views.

### Controllers

Use `feature` class method at controller, you can return 404 response at disabled feature endpoints.

```rb
class YourFeaturesController < ApplicationController
  feature :new_feature

  def index
  end
end
```

And some helper methods `feature_available?` and `feature_flags` are available.

```rb
class NewFeaturesController < ApplicationController
  def index
    unless feature_available?(:new_feature)
      redirect_to root_path
    end
  end

  def create
    # enable feature example
    cookies[:new_feature] = feature_flags[:new_feature]
  end
end
```

### Views

`feature_available?` helper method is available.

```erb
<% if feature_available?(:new_feature) %>
  <p>you can use new feature!</p>
<% else %>
  <p>you cannot use new feature!</p>
<% end %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iguchi1124/cookie_flag.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
