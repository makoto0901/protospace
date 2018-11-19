Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  delete 'prototypes/:id'  =>  'prototypes#destroy'
  resources :users, only: [:show, :edit, :update]
  resources :prototypes, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
end
