class ChangeThumbnailCreatorToTrashThumbnail < ActiveRecord::Migration[7.0]
  def up
    rename_table :thumbnail_creators, :thumbnails
  end

  def down
    rename_table :thumbnails, :thumbnail_creators
  end
end
