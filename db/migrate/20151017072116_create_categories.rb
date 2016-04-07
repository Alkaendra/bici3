class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.attachment :image
      t.string :meta_description
      t.boolean :featured

      t.timestamps null: false
    end
    add_index :categories, :slug, unique: true
  end
end
