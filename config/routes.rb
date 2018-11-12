Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  delete 'prototypes/:id'  =>  'prototypes#destroy'
  resources :prototypes, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit, :update]
end
