class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :image#renameでimage_idに変更済
      t.integer :genre_id
      t.text :explanation
      t.integer :nontax
      t.integer :sales_status

      t.timestamps
    end
  end
end
