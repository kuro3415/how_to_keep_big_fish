class ThumbnailsController < ApplicationController
  # 例 : 参考にする
  # def create
    # @interview = current_user.interviews.build(interview_params)
    # @interview.thumbnail = ThumbnailCreator.build(@interview.title, @interview.thumbnail, @interview.user.decorate.full_name)
    # if @interview.save
      # redirect_to interviews_path
    # else

  def create
    @post = Post.find(12) # 投稿を持ってくる
    image = ThumbnailCreator.build(@post.user.name, @post.article.fish.name, @post.post_image).tempfile.open.read
    send_data image, :type => 'image/png',:disposition => 'inline'
  end
end
