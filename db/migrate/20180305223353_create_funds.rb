class CreateFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :funds do |t|
      t.string :institution
      t.string :name
      t.text :description
      t.integer :amount
      t.datetime :start
      t.datetime :end
      t.string :url

      t.timestamps
    end
  end
end
