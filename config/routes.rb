Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/profile'
  get 'welcome/results'
  get 'welcome/favourites'

  post 'properties/:id/add_to_f', to: 'properties#add_to_f', as: 'add_to_f_property'
  post 'properties/:id/remove_from_f', to: 'properties#remove_from_f', as: 'remove_from_f_property'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :properties
end
