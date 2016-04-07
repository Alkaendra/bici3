class CreateWebimages < ActiveRecord::Migration
  def change
    create_table :webimages do |t|
      t.string :title
      t.string :module
      t.attachment :image

      t.timestamps null: false
    end
  end
end
