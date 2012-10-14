class Contrato < ActiveRecord::Base
  attr_accessible :contratista_id, :contrato_anio_norma_legal, 
  :contrato_expte, :contrato_fecha, :contrato_monto, 
  :contrato_nombre_obra, :contrato_nro_norma_legal, 
  :contrato_plazo_obra, :deleted_at, :finalizado,
  :localidad_id, :municipio_id, :tipo_norma_legal_id, :contratista_nombre,:ubicacion

  belongs_to :contratista
  belongs_to :tipo_norma_legal
  belongs_to :municipio
  belongs_to :localidad
  has_one :obra

  delegate :nombre, :to => :contratista, :prefix => true

  validates_presence_of :contratista_id, :tipo_norma_legal_id, :contrato_nro_norma_legal,  :contrato_anio_norma_legal, 
  	:contrato_expte, :contrato_fecha, :contrato_monto, :contrato_nombre_obra, :message =>'no puede estar en blanco'  



  self.per_page = 10

  def ubicacion
    "#{localidad.nombre} - #{municipio.nombre}"
  end

end
