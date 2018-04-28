class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :plan_name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
