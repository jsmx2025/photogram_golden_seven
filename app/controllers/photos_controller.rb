class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @photo = Photo.find_by({ :id => params[:id]} )
  end

  def new_form
  end

  def create_row
    p = Photo.new
    p.caption = params[:the_caption]
    p.source = params[:the_source]
    p.save
    redirect_to("http://localhost:3000")
  end

  def destroy
    @delete = Photo.destroy(params[:id])
    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo = Photo.find_by({ :id => params[:id]} )
  end

  def update_row
    u = Photo.find_by({ :id => params[:id]} )
    u.source = params[:the_new_source]
    u.caption = params[:the_new_caption]
    u.save
    redirect_to("http://localhost:3000/photos/#{params[:id]}")
end
end
