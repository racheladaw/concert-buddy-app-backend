Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace routes to look like localhost:3000.com/api/v1/resource
  namespace :api do
    namespace :v1 do
      resources :users
      resources :concerts
      resources :locations
    end
  end
end
