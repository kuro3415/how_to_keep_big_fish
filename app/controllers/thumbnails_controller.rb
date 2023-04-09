class ThumbnailsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    image = ThumbnailCreator.build(@post.user.name, @post.article.fish.name, @post.post_image).tempfile.open.read
    send_data image, :type => 'image/png',:disposition => 'inline'
  end
end
