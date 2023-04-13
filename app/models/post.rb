class Post < ApplicationRecord
  validates :body, presence: true
  validates :post_image, presence: true

  belongs_to :user
  belongs_to :article
  has_one :thumbnail, dependent: :destroy

  mount_uploader :post_image, PostImageUploader
end
