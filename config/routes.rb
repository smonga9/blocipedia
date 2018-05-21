Rails.application.routes.draw do

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :downgrade, only: [:new, :create]

  post 'downgrade/create'

  devise_for :users, controllers: { confirmations: 'confirmations' }

   get 'welcome/about'

  root 'welcome#index'

end
