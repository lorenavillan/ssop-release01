class TipoCertificado < ActiveRecord::Base
  attr_accessible :deleted_at, :tipo_certificado_descripcion

  validates_presence_of :tipo_certificado_descripcion , :message =>'no puede estar en blanco'
  
  self.per_page = 10

end
