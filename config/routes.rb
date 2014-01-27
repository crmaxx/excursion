Excursion::Application.routes.draw do
  root 'static_pages#home'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :tours, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :cities, only: [:index, :show]
end
