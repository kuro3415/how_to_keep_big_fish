class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :fish, foreign_key: true
      t.references :fish_tank, foreign_key: true

      t.timestamps
    end
  end
end
