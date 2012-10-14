class TipoEstado < ActiveRecord::Base
  attr_accessible :deleted_at, :tipo_estado_descripcion

  has_many :obras

  validates_presence_of :tipo_estado_descripcion , :message =>'no puede estar en blanco'
  
  self.per_page = 10

end
