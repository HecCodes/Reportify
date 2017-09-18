Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'
  root 'welcome#index'

  resources :sessions, only:[:new,:create]
  resources :users, only:[:new,:create,:destroy,:show]

  delete '/logout', to:'sessions#destroy'
end
