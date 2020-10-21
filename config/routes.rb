Rails.application.routes.draw do
  devise_for :users
  root 'reports#index'
  resources :reports
end
