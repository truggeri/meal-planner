Rails.application.routes.draw do
  root 'static_pages#home'

  resources :ingredients, only: %i[index show new create]
end
