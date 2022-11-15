class RemoveFishTankFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :articles, :fish_tanks
    remove_reference :articles, :fish_tank, index: true
  end
end
