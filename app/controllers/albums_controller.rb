class AlbumsController < ApplicationController
  before_filter :require_login
  
  def index
    @albums=Albums.all
  end
  
  def new
    @albums = Albums.new
  end

  def create
    
    @albums = Albums.new(params[:albums])
    if @albums.save
      
      redirect_to :action=>'index'
    else
      render  :action=>'new'
    end  
  end
  
  def show
    @albums=Albums.find(params[:id])
    
  end

  def edit
    
    @albums = Albums.find(params[:id])
  end

  def update
    
    @albums = Albums.find(params[:id])
    puts params[:albums]
    
    puts "************ ALBUMS UPDATE METHOD"
    
    if @albums.update_attributes(params[:albums])
      redirect_to :action=>'index'
    else
      render :action=>'edit'
    end
  
  end

  def destroy
    puts "************ ALBUMS DESTROY METHOD"
    puts params[:id]
    Albums.destroy(params[:id])
    redirect_to :action=>'index'
  end

end
