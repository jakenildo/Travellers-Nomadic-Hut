Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'omniauth_callbacks'
  }
  resources :dashboard
  get '/hosting-dashboard', to: 'dashboard#dashboard'
  root 'static_pages#home'
  resources :users
  resources :listings do
    resources :images, only: [:create, :destroy]
    resources :bookings
    member do
      get 'room'
      get 'description'
      get 'price'
      get 'photos'
      get 'amenity'
      get 'location'
      get 'check_current_bookings'
      get 'review_booking'
    end
  end

  get 'search' => 'search#search'
  get '/bookings', to: 'bookings#bookings', as: 'bookings'
  resources :reviews, only: [:create]

  get '/contact_us', to: "static_pages#contact_us"
  get '/about_us', to: "static_pages#about_us"
end
