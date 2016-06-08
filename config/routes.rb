Rails.application.routes.draw do
  resources :contact_custom_fields
  resources :contacts
  devise_for :users
  root 'home#index'
end