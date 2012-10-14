class CreateObras < ActiveRecord::Migration
  def change
    create_table :obras do |t|
      t.integer :contrato_id
      t.integer :estado_id
      t.date :obra_fecha_inicio
      t.date :obra_fecha_fin

      t.timestamps
    end
  end
end
