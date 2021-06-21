Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :advices, only: [:create]
  post '/advices/:advice_id/apply', to: 'aplicants#create'
  post '/advices/:advice_id/aplicants/:aplicant_id', to: 'aplicants#update'
  post 'register', to: 'users#create'
  resource :companies, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
end
