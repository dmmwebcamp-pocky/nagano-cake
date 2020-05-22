class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :ordered_postal_code
      t.string :ordered_address
      t.string :address_name
      t.integer :shipping_cost
      t.integer :total_price
      t.integer :payment_method
      t.integer :order_status
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
