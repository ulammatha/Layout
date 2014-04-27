class AddIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :id, :primary_key
  end
end
