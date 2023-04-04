class CreateThumbnailCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :thumbnail_creators do |t|
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
