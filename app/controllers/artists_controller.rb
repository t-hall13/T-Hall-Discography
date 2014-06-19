class ArtistsController < ApplicationController

layout "admin"
  
  before_action :confirm_logged_in

  def index
    @artists = Artist.sorted
  end

  def show
    @artist = Artist.find(params[:id])
  end


  def new
    @artist = Artist.new({:name => "Default"})
  end

  def create
    # Instantiate a new object using form parameters
    @artist = Artist.new(artist_params)
    # Save the object
    if @artist.save
    # If save succeeds, redirect to the index action
    flash[:notice] = "Artist created successfully, bro."
    redirect_to(:action => 'index')
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @artist = Artist.find(params[:id])
    # Update the object
    if @artist.update_attributes(artist_params)
    # If update succeeds, redirect to the index action
    flash[:notice] = "Artist updated successfully, bro."
    redirect_to(:action => 'show', :id => @artist.id)
    else
    # If save fails, redisplay the form so user can fix problems
    render('edit')
    end
  end

  def delete
    @artist = Artist.find(params[:id])
  end

  def destroy
    artist = Artist.find(params[:id]).destroy
    flash[:notice] = "'#{artist.name}' is gone, bro."
    redirect_to(:action => 'index')   
  end


  private
    def artist_params
      # Same as using "params[:artist]", except that it:
      # - raises an error if :artist is not present
      # - allows listed attributes to be mass-assigned
      params.require(:artist).permit(:name, :id)
    end
end