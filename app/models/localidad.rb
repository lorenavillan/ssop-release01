class Localidad < ActiveRecord::Base
  attr_accessible :deleted_at, :municipio_id, :nombre
  belongs_to :municipios
  belongs_to :contrato

  validates_presence_of :nombre, :message =>' de la Localidad no puede estar en blanco'
  validates_presence_of :municipio_id, :message =>'del Municipio no puede estar en blanco'
  


end
