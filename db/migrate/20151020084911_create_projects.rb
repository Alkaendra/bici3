class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :place
      t.attachment :image
      t.string :meta_description
      t.boolean :featured
      t.references :category, index: true
      t.references :product, index: true
      t.references :project_type, index: true

      t.timestamps null: false
    end
    add_index :projects, :slug, unique: true
    #add_foreign_key :projects, :categories
    #add_foreign_key :projects, :products
    #add_foreign_key :projects, :project_types
  end
end
