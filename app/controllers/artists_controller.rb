class ArtistsController < ApplicationController

    def index
      @artists = Artist.all
    end

    def new
      @artist = Artist.new
    end

    def create
      @artist = Artist.create(artist_params)
      if @artist.valid?
        @artist.save
        redirect_to artist_path(@artist)
      else
        render 'artists/new'
      end
    end

    def show
      @artist = Artist.find(params[:id])
    end

    def edit
      @artist = Artist.find(params[:id])
    end

    def update
      @artist = Artist.find(params[:id])
      @artist.update(artist_params)
      redirect_to artist_path(@artist)
    end

    private

    def artist_params(*args)
      params.require(:artist).permit(:name, :artist_id, :genre_id)
    end

end
