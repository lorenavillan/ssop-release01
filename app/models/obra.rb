class Obra < ActiveRecord::Base
  attr_accessible :contrato_id, :estado_id, :obra_fecha_fin, :obra_fecha_inicio

  belongs_to :contrato
  belongs_to :tipo_estado, :foreign_key => 'estado_id'

  delegate :contrato_nombre_obra, :contrato_monto,:contrato_plazo_obra,:contratista_nombre,:ubicacion, :to=>:contrato, :allow_nil=>true
  delegate :tipo_estado_descripcion, :to => :tipo_estado, :allow_nil=>true

  validates_presence_of :contrato_id, :message => "no puede estar vacio!"

  
self.per_page=10


end
