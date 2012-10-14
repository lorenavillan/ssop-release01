class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.integer :contratista_id
      t.integer :tipo_norma_legal_id
      t.integer :municipio_id
      t.integer :localidad_id
      t.string :contrato_nombre_obra
      t.integer :contrato_expte
      t.integer :contrato_nro_norma_legal
      t.integer :contrato_anio_norma_legal
      t.date :contrato_fecha
      t.decimal :contrato_monto
      t.integer :contrato_plazo_obra
      t.boolean :finalizado, :default => false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
