class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :image
      t.integer :genre
      t.text :explanation
      t.integer :nontax
      t.integer :sales_status
      t.timestamps
    end
  end
end
