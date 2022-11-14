class CreateFishTankArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :fish_tank_articles do |t|
      t.references :fish_tank, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
