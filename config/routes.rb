Rails.application.routes.draw do

  root to: 'user#new'

  get 'new', to: 'user#new'
  post 'create', to: 'user#create', as: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
