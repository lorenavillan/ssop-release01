class Contratista < ActiveRecord::Base
  attr_accessible :contratista_apellido, :contratista_cuit, 
  :contratista_domicilio_legal, :contratista_email, 
  :contratista_nombre, :contratista_telefono, :deleted_at, :empresa, :nombre
  has_many :contratos

 
  validates_presence_of :contratista_nombre, :contratista_apellido, :empresa, :message =>'no puede estar en blanco'  

  self.per_page = 3

  def nombre
  	"#{contratista_apellido}, #{contratista_nombre}"
  	
  end


end
