Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  delete 'prototypes/:id'  =>  'prototypes#destroy'
  resources :prototypes, only: [:index, :new, :create, :show] do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
