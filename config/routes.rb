Rails.application.routes.draw do
  resources :outings
  resources :relationships, except: [:edit, :new, :index]
  resources :users, except: [:edit, :new]


  post '/login', to: 'login#create', as: 'login' 
  post '/strangers/:id', to: 'users#stranger_index', as: 'strangers'
  post '/dates/:id', to: 'users#outings_index', as: 'dates'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
