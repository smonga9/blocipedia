Rails.application.routes.draw do

  resources :wikis

  devise_for :users, controllers: { confirmations: 'confirmations' }

   get 'welcome/about'

  root 'welcome#index'

end
