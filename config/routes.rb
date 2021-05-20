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
#      user_art_collections GET    /users/:user_id/art_collections(.:format)                                                art_collections#index
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
#              like_artwork POST   /artworks/:id/like(.:format)                                                             artworks#like
#            unlike_artwork POST   /artworks/:id/unlike(.:format)                                                           artworks#unlike
#          favorite_artwork POST   /artworks/:id/favorite(.:format)                                                         artworks#favorite
#        unfavorite_artwork POST   /artworks/:id/unfavorite(.:format)                                                       artworks#unfavorite
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
#   favorite_artworks_share POST   /artworks_shares/:id/favorite(.:format)                                                  artwork_shares#favorite
# unfavorite_artworks_share POST   /artworks_shares/:id/unfavorite(.:format)                                                artwork_shares#unfavorite
#           artworks_shares GET    /artworks_shares(.:format)                                                               artworks_shares#index
#                           POST   /artworks_shares(.:format)                                                               artworks_shares#create
#        new_artworks_share GET    /artworks_shares/new(.:format)                                                           artworks_shares#new
#       edit_artworks_share GET    /artworks_shares/:id/edit(.:format)                                                      artworks_shares#edit
#            artworks_share GET    /artworks_shares/:id(.:format)                                                           artworks_shares#show
#                           PATCH  /artworks_shares/:id(.:format)                                                           artworks_shares#update
#                           PUT    /artworks_shares/:id(.:format)                                                           artworks_shares#update
#                           DELETE /artworks_shares/:id(.:format)                                                           artworks_shares#destroy
#                  comments POST   /comments(.:format)                                                                      comments#create
#                   comment DELETE /comments/:id(.:format)                                                                  comments#destroy
#              like_comment POST   /comments/:id/like(.:format)                                                             comments#like
#            unlike_comment POST   /comments/:id/unlike(.:format)                                                           comments#unlike
#                           GET    /comments(.:format)                                                                      comments#index
#                           POST   /comments(.:format)                                                                      comments#create
#               new_comment GET    /comments/new(.:format)                                                                  comments#new
#              edit_comment GET    /comments/:id/edit(.:format)                                                             comments#edit
#                           GET    /comments/:id(.:format)                                                                  comments#show
#                           PATCH  /comments/:id(.:format)                                                                  comments#update
#                           PUT    /comments/:id(.:format)                                                                  comments#update
#                           DELETE /comments/:id(.:format)                                                                  comments#destroy
#           art_collections POST   /art_collections(.:format)                                                               art_collections#create
#            art_collection GET    /art_collections/:id(.:format)                                                           art_collections#show
#                           DELETE /art_collections/:id(.:format)                                                           art_collections#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy]
  
  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
    resources :art_collections, only: :index
  end
  
  resources :artworks, only: [:create, :show, :update, :destroy]
  
  resources :artworks do
    resources :comments, only: :index
    member do
      post :like, to: 'artworks#like', as: 'like'
      post :unlike, to: 'artworks#unlike', as: 'unlike'
      post :favorite, to: 'artworks#favorite', as: 'favorite'
      post :unfavorite, to: 'artworks#unfavorite', as: 'unfavorite'
    end
  end
  
  resources :artwork_shares, only: [:create, :destroy]
  
  resources :artworks_shares do
    member do
      post :favorite, to: 'artwork_shares#favorite', as: 'favorite'
      post :unfavorite, to: 'artwork_shares#unfavorite', as: 'unfavorite'
    end
  end
  
  resources :comments, only: [:create, :destroy]
  
  resources :comments do
    member do
      post :like, to: 'comments#like', as: 'like'
      post :unlike, to: 'comments#unlike', as: 'unlike'
    end
  end
  
  resources :art_collections, only: [:create, :show, :update, :destroy]
end
