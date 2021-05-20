class CollectionsController < ApplicationController
    def create
        collection = Collection.new(collection_params)

        if collection.save
            render json: collection
        else
            render json: collection.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        collection = Collection.find(params[:id])

        collection.destroy

        render json: collection
    end

    def collection_params
        params.require(:collection).permit(:artwork_id, :art_collection_id)
    end
end
