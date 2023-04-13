class Thumbnail < ApplicationRecord
  belongs_to :post

  mount_uploader :thumbnail_image, ThumbnailImageUploader
end
