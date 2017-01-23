Rails.application.routes.draw do
  root 'visit#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'directions', to: 'visit#directions'
  get 'tickets', to: 'visit#tickets'
  get 'about', to: 'visit#about'

  # Vendors
  get 'vendor', to: 'vendor#index'
  get 'vendor/post_registration', to: 'vendor#index'
  get 'vendor/registration_success', to: 'vendor#registration_success'
  post 'vendor/post_registration', to: 'vendor#post_registration'

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard'
  get 'admin/remove_authorized_user(/:id)', to: 'admin#remove_authorized_user'

  get 'admin/vendor', to: 'admin#vendor'
  get 'admin/remove_vendor(/:id)', to: 'admin#remove_vendor'

  # Admin post requests
  post 'admin/add_new_authorized_user', to: 'admin#add_new_authorized_user'


  # post ':controller(/:action(/:id(.:format)))'
  # get ':controller(/:action(/:id(.:format)))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
