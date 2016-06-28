Rails.application.routes.draw do
  root "films#index"

  resources :films, only: [:index, :new, :create]
end
