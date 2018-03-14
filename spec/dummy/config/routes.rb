Rails.application.routes.draw do
  root 'features#index'
  resources 'features', only: %i(index)
end
