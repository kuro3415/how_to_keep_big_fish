class CreateFishTanks < ActiveRecord::Migration[7.0]
  def change
    create_table :fish_tanks do |t|
      t.string :name, null: false
      t.string :fish_tank_image_front
      t.string :fish_tank_image_sideways

      t.timestamps
    end
  end
end
