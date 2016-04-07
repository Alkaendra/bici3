class CreateSuperAdminComentarios < ActiveRecord::Migration
  def change
    create_table :super_admin_comentarios do |t|

      t.timestamps
    end
  end
end
