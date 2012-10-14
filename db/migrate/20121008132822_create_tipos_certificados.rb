class CreateTiposCertificados < ActiveRecord::Migration
  def change
    create_table :tipos_certificados do |t|
      t.string :tipo_certificado_descripcion
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
