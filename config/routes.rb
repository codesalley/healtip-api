# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    post '/signup', to: 'sessions#signup'
    post '/login', to: 'sessions#login'
    get '/me', to: 'main#profile'
    get '/doctors', to: 'main#doctors'
    get '/appoitments', to: 'main#appoitments'
    post '/book', to: 'main#book'
    delete '/delete/:id', to: 'main#delete'
    put '/fav/:id', to: 'main#favorite'
    put '/unfav/:id', to: 'main#removeFav'
  end
end
