Rails.application.routes.draw do
  

  get 'idea/index'

  get 'idea/show'

  get 'user' => 'user#index'
  post '/register' => 'session#register'
  post 'users/:id/edit' => 'user#edit'
  delete 'users/:id/delete' => 'user#delete'
  get '/users/:id' => 'user#index'

  get '/ideas' => 'idea#index'
  get '/ideas/:id' => 'idea#show'
  post '/ideas/new' => 'idea#create'
  delete '/ideas/:id/delete' => 'idea#delete'

  post '/ideas/:id/like/:id' => 'like#like'
  post '/ideas/:id/unlike/:id' => 'like#unlike'


  get '/' => 'session#index'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
