class CommentsController < ApplicationController
before_action :find_blog
  def index
  	@comments=Comment.all
  end

  def new
@comment=Comment.new
  end
  def show
  	@comment=Comment.find(params[:id])
  end
  def create
    @comment = @blog.comments.create(params[:comment].permit(:body))
    @comment.user_id=current_user.id
    if @comment.save
    flash[:success]="Done!"
    redirect_to blog_path(@blog)
  else
    flash[:error]="Fail!"
  end
  end
  def edit
  	@comment=Comment.find(params[:id])
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
  def find_blog
    @blog=Blog.find(params[:blog_id])
  end
end
