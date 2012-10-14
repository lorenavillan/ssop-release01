class CreateLocalidades < ActiveRecord::Migration
  def change
    create_table :localidades do |t|
      t.integer :municipio_id
      t.string :nombre
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
