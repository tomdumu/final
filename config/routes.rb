Rails.application.routes.draw do
  root "forums#index"

  get '/forums' => 'forums#index'
  get '/forums/new' => 'forums#new'
  post '/forums' => 'forums#create'

  get '/forums/:id' => 'forums#show', :as => 'forum'

  get '/forums/:id/edit' => 'forums#edit', :as => 'forum_edit'
  patch '/forums/:id' => 'forums#update'

  delete '/forums/:id' => 'forums#destroy'
end
