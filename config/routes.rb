Rails.application.routes.draw do
  

  namespace :api do 
    post '/singup', to: 'sessions#singup'
    post '/login', to: 'sessions#login'
    get '/me', to: 'main#profile'
  end
end
