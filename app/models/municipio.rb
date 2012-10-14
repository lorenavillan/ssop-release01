class Municipio < ActiveRecord::Base
  attr_accessible :deleted_at, :nombre
  #has_many :localidades, :dependent =>:delete_all
  has_many :localidades
  belongs_to :contrato

  validates_presence_of :nombre, :message =>'del Municipio no puede estar en blanco'
  
  self.per_page = 10



end
