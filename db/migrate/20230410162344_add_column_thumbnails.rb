class AddColumnThumbnails < ActiveRecord::Migration[7.0]
  def change
    add_column :thumbnails, :thumbnail_image, :string
  end
end
