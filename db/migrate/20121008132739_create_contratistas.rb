class CreateContratistas < ActiveRecord::Migration
  def change
    create_table :contratistas do |t|
      t.string :contratista_nombre
      t.string :contratista_apellido
      t.string :empresa
      t.integer :contratista_cuit
      t.string :contratista_domicilio_legal
      t.string :contratista_telefono
      t.string :contratista_email
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
