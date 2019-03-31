Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#home'

  resources :ingredients, only: %i[index show new create destroy]
end
