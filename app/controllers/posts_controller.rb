class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'users/show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_image)
  end
end
