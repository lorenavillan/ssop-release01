class Localidad < ActiveRecord::Base
  attr_accessible :deleted_at, :municipio_id, :nombre
end
