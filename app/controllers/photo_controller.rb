class PhotoController < ApplicationController
  def index
    @photo=Photo.all
  end

  def show
    @photo=Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def new
    @photo= Photo.new
    @albums=Albums.all
  end

  def create
    @photo = Photo.new(params[:photo])

    puts "***************" + @photo.inspect
    if @photo.save
      
      redirect_to :action=>'index'
    else
      render  :action=>'new'
    end
  end

  def update
    @photo = Photo.find(params[:id])
    puts '************** update ******************'
    puts params[:photo]
    if @photo.update_attributes(params[:photo])
      redirect_to :action=>'index'
    else
      render :action=>'edit'
    end
  end

  def destroy
    puts params[:id]
    Photo.destroy(params[:id])
    redirect_to :action=>'index'
  end

end
