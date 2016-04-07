class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.attachment :image
      t.string :meta_description
      t.boolean :featured
      t.references :category, index: true

      t.timestamps null: false
    end
    add_index :products, :slug, unique: true
    add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
    #add_foreign_key :products, :categories
  end
end
