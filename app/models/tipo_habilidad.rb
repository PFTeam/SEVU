class TipoHabilidad < ActiveRecord::Base

  has_many :habilidades

  validates :nombre,
    :uniqueness => { 
      :message => 'No pueden existir dos Tipos con el mismo nombre', 
      :case_sensitive => false  }, 
    #:length => { :maximum => 250 }
    #:presence => true
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"}

  validates :descripcion, 
    #:presence => true, 
    #:length => { :maximum => 250 }
      :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"}
  
  validates_presence_of :nombre, :descripcion, message: "es un campo obligatorio"

end
