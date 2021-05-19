class ArtworksController < ApplicationController
    def index
        artworks = Artwork.where(artist_id: params[:user_id]) +
        Artwork.artworks_for_user(params[:user_id])

        render json: artworks
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update_attributes(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    def like
        like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def unlike
        like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
        if like.destroy
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end
