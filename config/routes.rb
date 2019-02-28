Rails.application.routes.draw do
  get 'subs/index'
  get 'subs/show'
  get 'subs/new'
  get 'subs/edit'
  root 'subs#index'

  resources :subs do
    resources :topics
  end
  # get '/subs', to: 'subs#index'
  # get '/subs/:id', to: 'subs#show'
  # get '/subs/:id', to: 'subs#edit'
  # put '/subs/:id', to: 'subs#update'
  # delete '/subs/:id', to: 'subs#destroy'

# /subs/:sub_id/topics/:id
  # sub_id 7
  # topic_id 4
  # /subs/7/topics/4


end
