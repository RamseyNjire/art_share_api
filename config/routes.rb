# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#             user_artworks GET    /users/:user_id/artworks(.:format)                                                       artworks#index
#             user_comments GET    /users/:user_id/comments(.:format)                                                       comments#index
#                           GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                           GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                  artworks POST   /artworks(.:format)                                                                      artworks#create
#                   artwork GET    /artworks/:id(.:format)                                                                  artworks#show
#                           PATCH  /artworks/:id(.:format)                                                                  artworks#update
#                           PUT    /artworks/:id(.:format)                                                                  artworks#update
#                           DELETE /artworks/:id(.:format)                                                                  artworks#destroy
#          artwork_comments GET    /artworks/:artwork_id/comments(.:format)                                                 comments#index
#                           GET    /artworks(.:format)                                                                      artworks#index
#                           POST   /artworks(.:format)                                                                      artworks#create
#               new_artwork GET    /artworks/new(.:format)                                                                  artworks#new
#              edit_artwork GET    /artworks/:id/edit(.:format)                                                             artworks#edit
#                           GET    /artworks/:id(.:format)                                                                  artworks#show
#                           PATCH  /artworks/:id(.:format)                                                                  artworks#update
#                           PUT    /artworks/:id(.:format)                                                                  artworks#update
#                           DELETE /artworks/:id(.:format)                                                                  artworks#destroy
#            artwork_shares POST   /artwork_shares(.:format)                                                                artwork_shares#create
#             artwork_share DELETE /artwork_shares/:id(.:format)                                                            artwork_shares#destroy
#                  comments POST   /comments(.:format)                                                                      comments#create
#                   comment DELETE /comments/:id(.:format)                                                                  comments#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy]
  resources :users do
    resources :artworks, only: :index
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:create, :show, :update, :destroy]
  resources :artworks do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
