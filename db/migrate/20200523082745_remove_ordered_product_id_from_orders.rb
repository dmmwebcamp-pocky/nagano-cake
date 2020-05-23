class RemoveOrderedProductIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :ordered_product_id, :integer
  end
end
