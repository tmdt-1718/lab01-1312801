class PaintingsController < ApplicationController
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
    #byebug
    @painting=Painting.new(painting_params)
    if @painting.save
  flash[:success]="Created image in album"
  redirect_to painting_path(@painting)
else
  flash[:error]="Fail!"
  render 'new'
end
  end

  private
  def painting_params
    params.require(:painting).permit(:name,:gallery_id, :image)
  end
end
