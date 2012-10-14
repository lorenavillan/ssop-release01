class TipoNormaLegal < ActiveRecord::Base
  attr_accessible :deleted_at, :tipo_norma_legal_descripcion
  has_many :contratos

  validates_presence_of :tipo_norma_legal_descripcion, :message =>"no puede estar en blanco"

  self.per_page = 10
  
end
