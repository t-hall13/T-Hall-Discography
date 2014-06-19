class PublicController < ApplicationController

	layout 'public'

	before_action :setup_navigation
  #before_action :find_album

  def index	
  	#intro text
  end

  def show
  	@album = Album.where(:id => params[:id], :permalink => params[:permalink]).first
  	if @album.nil?
  		redirect_to(:action =>'index')
  	else
  		# display the page content using show.html.erb
  	end
	end
  def songs_public
        @song = Song.find(params[:id])
  end

  def albums_public
    @album = Album.where(:id => params[:id], :permalink => params[:permalink])
  end

	private 
	def setup_navigation
		@artists = Artist.sorted
	end

  def find_album
    if params[:album_id]
      @album = Album.find(params[:id])
    end
  end
end
