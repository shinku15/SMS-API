Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      }

  resources :mobiles do
    collection { post 'import' }
  end

  get 'history/index'
  root 'history#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
