class BlogsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def index
    @blogs=Blog.all
  end

  def show
  @blog=Blog.find(params[:id])
impressionist(@blog)
  end

  def new
    @blog=Blog.new
  end

  def create
    @blog=Blog.new(blog_params)
    @blog.user_id=current_user.id
    if @blog.save
    flash[:success]="Done!"
    redirect_to blog_path(current_user.id)
  else
    render 'new'
    end
  end

  def edit
        @blog=Blog.find(params[:id])
  end

  def update
        @blog=Blog.find(params[:id])
        if @blog.update(title: params[:blog][:title],body: params[:blog][:body])
          flash[:success]= "Update blog #{@blog.id} successfully!!"
          redirect_to blog_path(@blog.id)
        else
          flash[:error]= "Fail to update blog #{@blog.id} !!"
          render :edit
        end
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
