class GalleriesController < ApplicationController
  before_action :correct_user,   only: :destroy
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
    def correct_user
     @gallery = current_user.galleries.find_by(id: params[:id])
     redirect_to root_url if @gallery.nil?
    end
end
