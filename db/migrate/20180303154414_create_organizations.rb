class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.string :website
      t.string :country
      t.string :dni

      t.timestamps
    end
  end
end
