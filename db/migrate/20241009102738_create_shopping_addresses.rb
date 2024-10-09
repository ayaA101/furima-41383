class CreateShoppingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_addresses do |t|

      t.timestamps
    end
  end
end
