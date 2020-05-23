class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.references :customer, foreign_key: true
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
