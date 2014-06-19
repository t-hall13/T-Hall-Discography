class SongsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in
  before_action :find_album

  def index
    #@songs = Song.where(:album_id => @album.id).sorted
    # or use....
    @songs = @album.songs.sorted
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new({:album_id => @album.id, :name => "Default"})
    @albums = Album.sorted
    @song_count = Song.count + 1
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Yowza! Another tune in the can!"
      redirect_to(:action => 'index', :album_id => @album.id)
    else
      @albums = Album.sorted
      @song_count = Song.count + 1
      render('new')
    end
  end

  def edit
    @song = Song.find(params[:id])
    @albums = Album.sorted
    @song_count = Song.count
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(song_params)
      flash[:notice] = "Epic changes, bro."
      redirect_to(:action => 'show', :id => @song.id, :album_id => @album.id)
    else
      @albums = Album.sorted
      @song_count = Song.count
      render('edit')
    end
  end

  

  def delete
    @song = Song.find(params[:id])
  end

  def destroy
        song = Song.find(params[:id]).destroy
        flash[:notice] = "Bummer! I was diggin that jam, bro"
        redirect_to(:action => 'index', :album_id => @album.id)
  end

  private
  def song_params
    params.require(:song).permit(:album_id, :name, :permalink, :position, :writer, :summary)
  end

  def find_album
    if params[:album_id]
      @album = Album.find(params[:album_id])
    end
  end
end
