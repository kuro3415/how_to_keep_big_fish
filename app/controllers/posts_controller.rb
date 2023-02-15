class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      @article = Article.find(@post.article_id)
      render 'articles/show'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @article = Article.find(@post.article_id)
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to request.referer
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_image).merge(article_id: params[:article_id])
  end
end
