Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root 'static_pages#home'

  resources :ingredients, only: %i[index show new create destroy]
end
