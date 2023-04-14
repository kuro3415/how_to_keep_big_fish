class ThumbnailsController < ApplicationController
  before_action :set_twitter_api

  def create
    @post = Post.find(params[:post_id])
    @thumbnail = @post.build_thumbnail
    @thumbnail.thumbnail_image = ThumbnailCreator.build(@post.user.name, @post.article.fish.name, @post.post_image)
    if @thumbnail.save
      image_path = @thumbnail.thumbnail_image
      redirect_to "https://twitter.com/share?url=#{image_path.to_s}", allow_other_host: true
    end
  end
end
