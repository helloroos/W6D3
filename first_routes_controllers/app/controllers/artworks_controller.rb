class ArtworksController < ApplicationController

    def index 
        artworks = Artwork.all
        render json: artworks
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def create
      artwork = Artwork.new(artwork_params)
      if artwork.save
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def update
        artwork = Artwork.find(params[:id])
        return redirect_to artwork_url if artwork.update(artwork_params)
        render json: artwork.errors.full_messages, status: :unprocessable_entity
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy 
        redirect_to artworks_url
    end

    protected

    def artwork_params
        params.require(:artwork).permit(:title, :image_url)
    end

end