class Post < ApplicationRecord
  belongs_to :user
  belongs_to :article

  mount_uploader :post_image, PostImageUploader
end
