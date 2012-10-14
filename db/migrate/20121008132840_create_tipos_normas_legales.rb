class CreateTiposNormasLegales < ActiveRecord::Migration
  def change
    create_table :tipos_normas_legales do |t|
      t.string :tipo_norma_legal_descripcion
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
