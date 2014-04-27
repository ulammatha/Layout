class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :rid
      t.integer :user_id
      t.string :name
      t.string :place
      t.string :city
      t.string :description

      t.timestamps
    end
    add_index :restaurants, :user_id
  end
end
