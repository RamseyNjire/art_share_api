class ArtworkSharesController < ApplicationController
    
    private

    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
