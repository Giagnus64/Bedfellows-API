Rails.application.routes.draw do
  resources :relationships
  resources :users, except: [:edit, :new]

  post '/login', to: 'login#create', as: 'login' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
