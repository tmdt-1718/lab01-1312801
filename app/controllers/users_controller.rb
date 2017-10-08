class UsersController < ApplicationController
  def index
  end
  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
    @blogs = @user.blogs.paginate(page: params[:page])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success]= "Congrastulation! U have registered suceessfully!!"
      redirect_to user_path(@user)
    else
      render 'new'
  end
  def destroy
    @blog.destroy
    flash[:success]=" Blogs deleted!"
    redirect_to request.referrer || user_path(current_user.id)
  end
end
private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
