class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    @article = @post.article
    if @post.save
      redirect_to request.referer, success: t('.success')
    else
      flash[:danger] = t('.fail')
      render 'articles/show'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @article = @post.article
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(current_user), success: t('.success')
    else
      flash[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer, success: t('.success')
  end

  private

  def post_params
    params.require(:post).permit(:body, :post_image).merge(article_id: params[:article_id])
  end
end
