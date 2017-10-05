class CommentsController < ApplicationController
  def index
  	@comments=Comment.all
  end

  def new
@comment=Comment.all
  end
  def show
  	@comment=Comment.find(params[:id])
  end
  def edit
  end
end
