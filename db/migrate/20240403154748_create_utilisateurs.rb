class CreateUtilisateurs < ActiveRecord::Migration[7.0]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :email

      t.timestamps
    end
  end
end
