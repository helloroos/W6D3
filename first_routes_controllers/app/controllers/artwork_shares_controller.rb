class ArtworkSharesController < ApplicationController

    def create
      share = Artwork.new(artwork_shares_params)
      if share.save
        render json: share
      else
        render json: share.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
        share = Artwork.find(params[:id])
        share.destroy 
        redirect_to artworks_url
    end

    protected

    def artwork_shares_params
        params.require(:artwork).permit(:username)
    end

end