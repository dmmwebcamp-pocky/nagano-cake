class ChangeCustomerStatusOfCustomers < ActiveRecord::Migration[5.2]
  def up
    change_column :customers, :customer_status, :integer, default: 0, limit: 1
  end

# ↓は元々の状態

  def down
    change_column :customers, :customer_status, :integer
  end
end
