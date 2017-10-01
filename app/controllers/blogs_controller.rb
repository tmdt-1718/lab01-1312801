class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
  end
  def show
  @blog=Blog.find(params[:id])
  end
  def new
    @blog=Blog.new
  end
  def create
    @blog=Blog.new(blog_params)
    @blog.user_id=current_user.id
    if @blog.save
    flash[:success]="Done!"
    redirect_to blog_path(@blog)
  else
    render 'new'
    end
  end

  def edit
        @blog=Blog.find(params[:id])
  end
  def update
        @blog=Blog.find(params[:id])
  end
  def destroy
        @blog=Blog.find(params[:id])
  end


private
def blog_params
  params.require(:blog).permit(:title, :body)
end
end
