Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  namespace :api do
    namespace :v1 do
      get '/playlist/:id/tracks', to: 'tracks#index'
    end
  end
end
