class CreateRestaurants < ActiveRecord::Migration
  def change
  	create_table :restaurants do |t|
  		t.string :name
  		t.string :address
  		t.float :rating
  	end
  end
end
