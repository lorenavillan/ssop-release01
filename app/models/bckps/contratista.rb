class Contratista < ActiveRecord::Base
  attr_accessible :contratista_apellido, :contratista_cuit, :contratista_domicilio_legal, :contratista_email, :contratista_nombre, :contratista_telefono, :deleted_at, :empresa
end
