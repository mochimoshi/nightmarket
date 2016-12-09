Rails.application.routes.draw do
  root 'visit#index'

  post ':controller(/:action(/:id(.:format)))'
  get ':controller(/:action(/:id(.:format)))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
