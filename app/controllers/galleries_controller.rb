class GalleriesController < ApplicationController
  def index
@galleries=Gallery.all
  end

  def new
@gallery=Gallery.new
  end

  def show
@gallery=Gallery.find(params[:id])
@paintings=Painting.where(gallery: @gallery).order("created_at DESC")
  impressionist(@gallery)
  end

  def create
@gallery=Gallery.new(gallery_params)
@gallery.user_id=current_user.id
if @gallery.save
  flash[:success]="U created galleries successfully!!"
redirect_to galleries_path(@gallery)
else
  flash[:error]="Try again!!"
  render 'new'
  end
end

def edit
  @gallery=Gallery.find(params[:id])
end

def destroy
  @gallery=Gallery.find(params[:id])
   @gallery.destroy
  flash[:success]=" Gallery deleted!"
  redirect_back(fallback_location: root_path)
end

  private

  def gallery_params
      params.require(:gallery).permit(:name,:image)
    end
end
