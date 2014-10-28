class AsistenciaEvento < ActiveRecord::Base
  belongs_to :evento_publico
  belongs_to :usuario

  def self.participando(usu, evento)
	  AsistenciaEvento.where(usuario: usu, evento_publico: evento).count
  end

end
