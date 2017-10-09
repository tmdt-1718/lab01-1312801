class BlogsController < ApplicationController
  def index
    @blogs=Blog.all
    end

  def new
    @blog=Blog.new
  end

  def show
  @blog=Blog.find(params[:id])
  @comments=Comment.where(blog: @blog).order("created_at DESC")
  impressionist(@blog)
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
        if @blog.update(title: params[:blog][:title],body: params[:blog][:body])
          flash[:success]= "Update blog #{@blog.id} successfully!!"
          redirect_to blog_path(@blog.id)
        else
          flash[:error]= "Fail to update blog #{@blog.id} !!"
          render :edit
        end
  end

  def destroy
    @blog=Blog.find(params[:id])
    @blog.destroy
    flash[:success]=" Blogs deleted!"
    redirect_to blogs_path

end
private

def blog_params
  params.require(:blog).permit(:title, :body)
end
end
