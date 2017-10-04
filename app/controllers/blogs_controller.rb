class BlogsController < ApplicationController
  before_action :correct_user,   only: :destroy
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
    redirect_to user_path(current_user.id)
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
    @blog.destroy
    flash[:success]=" Blogs deleted!"
    redirect_to request.referrer
  end
private
def blog_params
  params.require(:blog).permit(:title, :body)
end
def correct_user
 @blog = current_user.blogs.find_by(id: params[:id])
 redirect_to root_url if @blog.nil?
end
end
