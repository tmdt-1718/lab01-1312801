class PaintingsController < ApplicationController
  before_action :find_album
  def index
    @paintings=Painting.all
  end
  def new
    @painting=Painting.new
  end
  def show
    @painting=Painting.find(params[:id])
  end
  def create
    @painting =@gallery.paintings.create(params[:painting].permit(:body,:image,:remote_image_url))
    @painting.user_id=current_user.id
    if @painting.save
  flash[:success]="Created image in album"
  redirect_to gallery_path(@gallery)
else
  flash[:error]="Fail!"
  render 'new'
end
  end
  private
  def find_album
    @gallery=Gallery.find(params[:gallery_id])
  end
end
