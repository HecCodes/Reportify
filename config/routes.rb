Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'
  root 'welcome#index'

  resources :sessions, only:[:new,:create]
  resources :users, only:[:new,:create,:destroy,:show]
  resources :parents, except:[:destroy]
  resources :students, except:[:destroy]

  delete '/students/:id', to:'students#destroy'
  delete '/parents/:id', to:'parents#destroy'
  delete '/logout', to:'sessions#destroy'
end
