class RenameAdressColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :adress_name, :address_name
  end
end
