class AlbumsController < ApplicationController

    def index
        @albums = Album.all
        render :index
    end
    
    def show
        @album = Album.find_by(id: params[:id]) # why @user? show info in view?
        render :show
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)
        
        if @album.save
            debugger
            redirect_to album_url(@album)
        else
            # flash errors
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render :edit        
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            # flash errors
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])
        @album.destroy
        redirect_to albums_url
    end

    private

    def album_params
        params.require(:album).permit(:name, :band_id, :year, :studio_album)
    end
end
