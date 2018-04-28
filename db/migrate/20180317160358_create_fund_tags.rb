class CreateFundTags < ActiveRecord::Migration[5.1]
  def change
    create_table :fund_tags do |t|
      t.references :fund, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
