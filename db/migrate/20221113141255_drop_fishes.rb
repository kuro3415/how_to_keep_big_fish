class DropFishes < ActiveRecord::Migration[7.0]
  def change
    drop_table :fishes
  end
end
