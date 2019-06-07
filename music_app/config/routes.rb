Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show, :new, :create]
  
  # ??? - https://open.appacademy.io/learn/full-stack-in-person/rails/routing-ii--nested-collections

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:index, :create, :edit, :update, :show, :destroy]
end