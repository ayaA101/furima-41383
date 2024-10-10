class CreateShoppingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_addresses do |t|
      t.string :postalcode, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building
      t.string :phonenumber, null:false
      t.references :order, null:false, foreign_key: true
      t.timestamps
    end
  end
end
