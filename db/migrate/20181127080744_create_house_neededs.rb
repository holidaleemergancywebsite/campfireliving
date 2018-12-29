class CreateHouseNeededs < ActiveRecord::Migration[5.2]
  def change
    create_table :house_neededs do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.integer :pets
      t.integer :smoke_free
      t.decimal :desired_price
      t.string :price_type
      t.integer :type_of_housing
      t.integer :bedroom
      t.decimal :bathroom  
      #t.GEOMETRY :geocode
      t.string :type_of_term 
      t.string :comment, :limit => 1024
      t.timestamps
    end
  end
end
