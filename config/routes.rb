Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/profile'
  get 'welcome/results'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :properties
end
