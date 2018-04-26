Rails.application.routes.draw do
  root 'welcome#index'

  resources :itineraries do
    resources :events
  end

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      post 'follow'
      delete 'unfollow'
    end
  end
  get '/following', to: 'users#following'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
