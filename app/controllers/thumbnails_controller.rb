class ThumbnailsController < ApplicationController
  before_action :set_twitter_api

  def create
    @thumbnail = Thumbnail.find(2)

    image_path = @thumbnail.thumbnail_image

    redirect_to "https://twitter.com/share?url=#{image_path.to_s}", allow_other_host: true
  end
end
