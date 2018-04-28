class AddDatesToSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :start, :date
    add_column :subscriptions, :end, :date
  end
end
