class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :json => "404"
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
