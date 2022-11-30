class AddColumnFish < ActiveRecord::Migration[7.0]
  def change
    add_column :fish, :medium, :integer
  end
end
