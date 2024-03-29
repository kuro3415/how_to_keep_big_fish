class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.string :body
      t.string :post_image

      t.timestamps
    end
  end
end
