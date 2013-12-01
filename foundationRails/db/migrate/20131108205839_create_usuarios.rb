class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :username
      t.string :pass
      t.boolean :admin
      t.string :email
      t.string :nombre
      t.string :a_paterno
      t.string :a_materno
      t.boolean :sexo
      t.date :f_nacimiento

      t.timestamps
    end
  end
end
