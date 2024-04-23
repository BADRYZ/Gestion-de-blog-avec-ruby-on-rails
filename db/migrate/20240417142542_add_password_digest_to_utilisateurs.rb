class AddPasswordDigestToUtilisateurs < ActiveRecord::Migration[7.0]
  def change
    add_column :utilisateurs, :password_digest, :string
  end
end
