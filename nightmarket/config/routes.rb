Rails.application.routes.draw do
  root 'visit#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'directions', to: 'visit#directions'
  get 'tickets', to: 'visit#tickets'
  get 'about', to: 'visit#about'

  # Student Groups
  get 'student', to: 'student#registration'
  get 'student/post_registration', to: 'student#registration'
  post 'student/post_registration', to: 'student#post_registration'
  get 'student/registration_success', to: 'student#registration_success'
  get 'student/dashboard', to: 'student#dashboard'

  # Vendors
  get 'vendor', to: 'vendor#index'
  get 'vendor/post_registration', to: 'vendor#index'
  get 'vendor/registration_success', to: 'vendor#registration_success'
  post 'vendor/post_registration', to: 'vendor#post_registration'

  get 'vendor/login', to: 'vendor#login'
  get 'vendor/post_login', to: 'vendor#login'
  post 'vendor/post_login', to: 'vendor#post_login'
  get 'vendor/view_registration', to: 'vendor#view_registration'
  get 'vendor/logout', to: 'vendor#logout'

  # Admin
  get 'admin/dashboard', to: 'admin#dashboard'
  get 'admin/remove_authorized_user(/:id)', to: 'admin#remove_authorized_user'

  get 'admin/vendor', to: 'admin#vendor'
  get 'admin/remove_vendor(/:id)', to: 'admin#remove_vendor'
  get 'admin/approve_vendor(/:id)', to: 'admin#approve_vendor'
  get 'admin/reject_vendor(/:id)', to: 'admin#reject_vendor'

  get 'admin/group', to: 'admin#group'
  get 'admin/remove_group(/:id)', to: 'admin#remove_group'
  get 'admin/approve_group(/:id)', to: 'admin#approve_group'
  get 'admin/reject_group(/:id)', to: 'admin#reject_group'

  # Admin post requests
  post 'admin/add_new_authorized_user', to: 'admin#add_new_authorized_user'


  # post ':controller(/:action(/:id(.:format)))'
  # get ':controller(/:action(/:id(.:format)))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
