class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps null: false
    end
    add_index :project_types, :slug, unique: true
  end
end
