Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  get 'about', to: 'pages#about'
end
