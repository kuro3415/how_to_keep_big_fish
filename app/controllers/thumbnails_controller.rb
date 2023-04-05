class ThumbnailsController < ApplicationController
  include ThumbnailCreator

  # 例 : 参考にする
  # def create
    # @interview = current_user.interviews.build(interview_params)
    # @interview.thumbnail = ThumbnailCreator.build(@interview.title, @interview.thumbnail, @interview.user.decorate.full_name)
    # if @interview.save
      # redirect_to interviews_path
    # else

  def create
    ThumbnailCreator.build(@post.user.name, @post.article.fish.name, @post.post_image)
  end
end
