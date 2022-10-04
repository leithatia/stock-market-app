Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  resources :stocks, only: %w[index show]
  get 'my_stocks', to: 'stocks#my_stocks'
  get 'about', to: 'pages#about'
end
