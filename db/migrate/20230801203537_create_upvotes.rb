class CreateUpvotes < ActiveRecord::Migration[7.0]
  def change
    create_table :upvotes do |t|
      t.boolean :status
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
