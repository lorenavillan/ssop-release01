# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121008232844) do

  create_table "contratistas", :force => true do |t|
    t.string   "contratista_nombre"
    t.string   "contratista_apellido"
    t.string   "empresa"
    t.integer  "contratista_cuit"
    t.string   "contratista_domicilio_legal"
    t.string   "contratista_telefono"
    t.string   "contratista_email"
    t.datetime "deleted_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "contratos", :force => true do |t|
    t.integer  "contratista_id"
    t.integer  "tipo_norma_legal_id"
    t.integer  "municipio_id"
    t.integer  "localidad_id"
    t.string   "contrato_nombre_obra"
    t.integer  "contrato_expte"
    t.integer  "contrato_nro_norma_legal"
    t.integer  "contrato_anio_norma_legal"
    t.date     "contrato_fecha"
    t.decimal  "contrato_monto"
    t.integer  "contrato_plazo_obra"
    t.boolean  "finalizado",                :default => false
    t.datetime "deleted_at"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "localidades", :force => true do |t|
    t.integer  "municipio_id"
    t.string   "nombre"
    t.datetime "deleted_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "municipios", :force => true do |t|
    t.string   "nombre"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "obras", :force => true do |t|
    t.integer  "contrato_id"
    t.integer  "estado_id"
    t.date     "obra_fecha_inicio"
    t.date     "obra_fecha_fin"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tipos_certificados", :force => true do |t|
    t.string   "tipo_certificado_descripcion"
    t.datetime "deleted_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tipos_estados", :force => true do |t|
    t.string   "tipo_estado_descripcion"
    t.datetime "deleted_at"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "tipos_normas_legales", :force => true do |t|
    t.string   "tipo_norma_legal_descripcion"
    t.datetime "deleted_at"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
