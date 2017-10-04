class GalleriesController < ApplicationController
  def index
@galleries=Gallery.all
  end

  def new
@gallery=Gallery.new
  end

  def show
@gallery=Gallery.find(params[:id])
  end

  def create
@gallery=Gallery.create!(gallery_params)
@gallery.user_id=current_user.id
if @gallery.save
  flash[:success]="U created galleries successfully!!"
redirect_to galleries_path
else
  flash[:error]="Try again!!"
  render 'new'
  end
end

  private
  def gallery_params
      params.require(:gallery).permit(:name,:user_id)
    end
end
