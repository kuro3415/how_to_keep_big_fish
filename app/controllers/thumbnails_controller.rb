class ThumbnailsController < ApplicationController
  skip_before_action :require_login, only: %i[show]

  def show
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @thumbnail = @post.build_thumbnail
    @thumbnail.thumbnail_image = ThumbnailCreator.build(@post.user.name, @post.article.fish.name, @post.post_image)
    if @thumbnail.save
      redirect_to article_post_thumbnail_path(@post.article, @post, @post.thumbnail)
    end
  end
end
