class AddAdminToUtilisateur < ActiveRecord::Migration[7.0]
  def change
    add_column :utilisateurs, :admin, :boolean,:default=>false
  end
end
