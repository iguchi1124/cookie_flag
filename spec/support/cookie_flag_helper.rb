module CookieFlagHelper
  def feature_flags
    Rails.application.config_for(CookieFlag.config.name).with_indifferent_access
  end

  def enable_feature(feature_name)
    unless on_a_page?
      visit '/'
    end

    case Capybara.current_driver
    when :selenium_chrome_headless
      Capybara.current_session.driver.browser.manage.add_cookie(
        name: feature_name,
        value: feature_flags[feature_name]
      )
    else
      raise "cookie not supported. driver=`#{Capybara.current_session.inspect}`"
    end
  end

  private

  def on_a_page?
    current_url = Capybara.current_session.driver.browser.current_url
    current_url && current_url != '' && current_url != 'about:blank' && current_url != 'data:,'
  end
end
