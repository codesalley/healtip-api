Rails.application.routes.draw do
  

  namespace :api do 
    post '/singup', to: 'sessions#singup'
    post '/login', to: 'sessions#login'
    get '/me', to: 'main#profile'
    get '/doctors', to: 'main#doctors'
    post '/book', to: 'main#book'
    delete '/delete/:id', to: 'main#delete'
    put '/fav/:id', to: 'main#favorite'
    put '/unfav/:id', to: 'main#removeFav'

  end
end
