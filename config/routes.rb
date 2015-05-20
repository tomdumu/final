Rails.application.routes.draw do
  root "forums#index"

  get '/forums' => 'forums#index'
  get '/forums/new' => 'forums#new'
  post '/forums' => 'forums#create'

  get '/forums/:id' => 'forums#show', :as => 'forum'

  get '/forums/:id/edit' => 'forums#edit', :as => 'forum_edit'
  patch '/forums/:id' => 'forums#update'

  delete '/forums/:id' => 'forums#destroy'

  ##### Sign Up and Sign In and Sign Out
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/sessions' => 'sessions#create'

  ##### Page for a new session (login)
  get '/signin' => 'sessions#new' 
  ##### Create a new session
  post '/sessions' => 'sessions#create'
  ##### Delete a session (signout)
  get '/signout' => 'sessions#destroy'

  ##### Show and edit the user
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show', :as => 'user'
  get '/users/:id/edit' => 'users#edit', :as => 'user_edit'
  get '/users/:id/editpw' => 'users#editpw', :as => 'user_editpw'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/posts' => 'posts#index'
  get '/posts/:id' => 'posts#show', :as => 'post'
  post '/posts' => 'posts#create'
  get '/posts/:id/edit'=> 'posts#edit', :as => 'post_edit'
  patch '/posts/:id' => 'posts#update'
  delete '/posts/:id' => 'posts#destroy'

  get '/comments/:id' => 'comments#show', :as => 'comment'
  post '/comments' => 'comments#create'
  get '/comments/:id/edit'=> 'comments#edit', :as => 'comment_edit'
  patch '/comments/:id' => 'comments#update'
  delete '/comments/:id' => 'comments#destroy'

  ##### Watch
  get '/watches/:user_id' => 'watches#index', :as => 'watches'
  post '/users/:user_id/watches/:forum_id' => 'watches#create', :as => 'watch' 

  delete '/users/:user_id/watches/:forum_id' => 'watches#destroy'
end
