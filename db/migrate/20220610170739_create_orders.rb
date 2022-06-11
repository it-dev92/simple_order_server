class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product_number, null: false, index: { unique: true }
      t.string :name, null: false
      t.integer :state, default: 0, null: false
      t.datetime :delivered_at

      t.timestamps
    end
  end
end
