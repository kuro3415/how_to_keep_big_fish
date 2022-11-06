class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.string :name, null: false
      t.string :scientific_name
      t.text :body
      t.integer :body_length
      t.integer :minimum
      t.integer :maximum
      t.string :temperature
      t.string :water_quality
      t.string :fish_image_xs
      t.string :fish_image_s
      t.string :fish_image_m
      t.string :fish_image_l
      t.string :fish_image_xl

      t.timestamps
    end
  end
end
