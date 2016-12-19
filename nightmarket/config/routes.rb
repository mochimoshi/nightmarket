Rails.application.routes.draw do
  root 'visit#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'directions', to: 'visit#directions'
  get 'tickets', to: 'visit#tickets'
  get 'about', to: 'visit#about'

  get 'vendor', to: 'vendor#index'

  get 'admin/dashboard', to: 'admin#dashboard'

  # Admin post requests
  post 'admin/add_new_authorized_user', to: 'admin#add_new_authorized_user'

  # post ':controller(/:action(/:id(.:format)))'
  # get ':controller(/:action(/:id(.:format)))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
