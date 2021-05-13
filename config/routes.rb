Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :users do
    resources :artworks, only: :index
  end
  resources :artworks, only: [:create, :show, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]
end
