CookieFlag::Console.routes.draw do
  root to: 'features#index'
  resources :features, only: %i(index update), param: :feature_name
end
