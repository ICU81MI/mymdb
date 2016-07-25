Rails.application.routes.draw do
  devise_for :users

  root to: "films#index"
  resources :films
end
