Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  resources :stocks, only: %w[index show]
  get 'about', to: 'pages#about'
end
