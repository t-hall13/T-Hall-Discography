

class AlbumsController < ApplicationController

  layout "admin"
  
  before_action :confirm_logged_in
  before_action :find_artist

  def index
    @albums = Album.sorted
  end

  def show
    @album = Album.find(params[:id])
  end


  def new
    @album = Album.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @album = Album.new(album_params)
    # Save the object
    if @album.save
    # If save succeeds, redirect to the index action
    flash[:notice] = "Album created successfully, bro."
    redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @album = Album.find(params[:id])
    # Update the object
    if @album.update_attributes(album_params)
    # If update succeeds, redirect to the index action
    flash[:notice] = "Album updated successfully, bro."
    redirect_to(:action => 'show', :id => @album.id)
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @album = Album.find(params[:id])
  end

  def destroy
    album = Album.find(params[:id]).destroy
    flash[:notice] = "'#{album.name}' is gone, bro."
    redirect_to(:action => 'index')   
  end


  private
    def album_params
      # Same as using "params[:album]", except that it:
      # - raises an error if :album is not present
      # - allows listed attributes to be mass-assigned
      params.require(:album).permit(:name, :artist_id, :album_artist, :year, :summary, :position, :permalink, :avatar)
    end

    def find_artist
    if params[:artist_id]
      @artist = Artist.find(params[:artist_id])
    end
  end
end
