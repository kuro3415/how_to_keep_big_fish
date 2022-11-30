class AddThumbnailToFish < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :thumbnail, :string
  end
end
