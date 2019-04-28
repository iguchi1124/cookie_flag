class CookieFlag::FeaturesController < CookieFlag::ApplicationController
  def index
    @features = feature_flags.keys
  end

  def update
    feature_name = params[:feature_name]
    flag = feature_flags[feature_name]
    enabled = ActiveRecord::Type::Boolean.new.cast(feature_params[:enabled])
    if flag && enabled
      cookies[feature_name] = flag.to_s
    else
      cookies.delete(feature_name)
    end

    redirect_to action: :index
  end

  private

  def feature_params
    params.require(:feature).permit(:enabled)
  end
end
