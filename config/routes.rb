Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/welcome', to: 'welcome#index'
  root 'welcome#index'

  resources :sessions, only:[:new,:create]
  resources :users, only:[:new,:create,:destroy,:show]
  resources :parents, except:[:destroy]
  resources :students, except:[:destroy]
  resources :reports, except:[:destroy,:create]

  resources :students, only:[:create] do
    resources :reports
  end
  delete '/reports/:id', to: 'reports#destroy'
  delete '/students/:id', to:'students#destroy'
  delete '/parents/:id', to:'parents#destroy'
  delete '/logout', to:'sessions#destroy'
end

#   Prefix Verb   URI Pattern                  Controller#Action
#      welcome GET    /welcome(.:format)           welcome#index
#         root GET    /                            welcome#index
#     sessions POST   /sessions(.:format)          sessions#create
#  new_session GET    /sessions/new(.:format)      sessions#new
#        users POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#         user GET    /users/:id(.:format)         users#show
#              DELETE /users/:id(.:format)         users#destroy
#      parents GET    /parents(.:format)           parents#index
#              POST   /parents(.:format)           parents#create
#   new_parent GET    /parents/new(.:format)       parents#new
#  edit_parent GET    /parents/:id/edit(.:format)  parents#edit
#       parent GET    /parents/:id(.:format)       parents#show
#              PATCH  /parents/:id(.:format)       parents#update
#              PUT    /parents/:id(.:format)       parents#update
#     students GET    /students(.:format)          students#index
#              POST   /students(.:format)          students#create
#  new_student GET    /students/new(.:format)      students#new
# edit_student GET    /students/:id/edit(.:format) students#edit
#      student GET    /students/:id(.:format)      students#show
#              PATCH  /students/:id(.:format)      students#update
#              PUT    /students/:id(.:format)      students#update
#      reports GET    /reports(.:format)           reports#index
#              POST   /reports(.:format)           reports#create
#   new_report GET    /reports/new(.:format)       reports#new
#  edit_report GET    /reports/:id/edit(.:format)  reports#edit
#       report GET    /reports/:id(.:format)       reports#show
#              PATCH  /reports/:id(.:format)       reports#update
#              PUT    /reports/:id(.:format)       reports#update
#              DELETE /reports/:id(.:format)       reports#destroy
#              DELETE /students/:id(.:format)      students#destroy
#              DELETE /parents/:id(.:format)       parents#destroy
      # logout DELETE /logout(.:format)            sessions#destroy