class CreateTiposEstados < ActiveRecord::Migration
  def change
    create_table :tipos_estados do |t|
      t.string :tipo_estado_descripcion
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
