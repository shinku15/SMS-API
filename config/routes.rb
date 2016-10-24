Rails.application.routes.draw do

  get 'history/index'
  resources :mobiles
  root 'mobiles#new'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
