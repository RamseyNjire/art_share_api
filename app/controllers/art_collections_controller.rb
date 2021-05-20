class ArtCollectionsController < ApplicationController
    def index
        art_collections = ArtCollection.where(collector_id: params[:user_id])

        render json: art_collections
    end

    def create
        art_collection = ArtCollection.new(art_collection_params)

        if art_collection.save
            render json: art_collection
        else
            render json: art_collection.errors.full_messages, status: unprocessable_entity
        end
    end

    def show
        render json: ArtCollection.find(params[:id])
    end

    def update
        art_collection = ArtCollection.find(params[:id])

        if art_collection.update_attributes(art_collection_params)
            render json: art_collection
        else
            render json: art_collection.errors.full_messages, status: unprocessable_entity
        end
    end

    def destroy
        art_collection = ArtCollection.find(params[:id])
        
        art_collection.destroy

        render json: art_collection
    end

    def art_collection_params
        params.require(:art_collection).permit(:name, :description, :collector_id)
    end
end
