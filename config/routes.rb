Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace routes to look like localhost:3000.com/api/v1/resource
  root "application#index"

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      post '/signup', to: 'users#create'
      get '/get_current_user', to: 'sessions#getCurrentUser'
      delete '/logout', to: 'sessions#destroy'
      get '/get_upcoming_concerts', to: 'concerts#upcomingConcerts'
      get '/get_concert_data', to: 'concerts#getUpcomingConcertsFromSongkick'
      post '/save_concert', to: 'saved_concerts#create'
      get '/saved_concerts', to: 'saved_concerts#index'
      get '/concert/:concert_id/users', to: 'concerts#getUsersOfConcert'
      resources :users
      post '/users/:id/upload_photo', to: 'users#uploadPhoto'
      resources :concerts
      resources :locations
      resources :artists
    end
  end
end
