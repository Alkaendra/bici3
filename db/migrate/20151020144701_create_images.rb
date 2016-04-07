class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.integer :category_id
      t.integer :product_id
      t.integer :project_id
      t.integer :post_id
      t.integer :webimage_id

      t.attachment :photo
      t.string :headline
      t.text :caption


      t.timestamps null: false
    end
  end
end
