class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.attachment :image
      t.boolean :published
      t.string :meta_description
      t.attachment :image

      t.timestamps null: false
    end
    add_index :posts, :slug, unique: true
  end
end
