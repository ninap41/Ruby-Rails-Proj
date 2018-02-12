Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'posts#index'

resources :posts #resources gives a list of all CRUD possibilities when typing "rake routes"
# get '/posts/new' => 'posts#new'
	
post 'posts' => 'posts#create'
delete  '/posts/:id' => 'posts#destroy'

end
