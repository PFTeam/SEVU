class Habilidad < ActiveRecord::Base
  belongs_to :tipo_habilidad

  has_many :requisitos
  has_many :actividades, :through => :requisitos

  has_many :experiencias
  has_many :voluntarios, :through => :experiencias
  
  before_destroy :puede_eliminarse?

  def puede_eliminarse?
    if !experiencias.empty? then
      errors.add :base, 'No puede eliminarse debido a que existen usuarios que lo utilizan'
      return false
    else
      return true
    end
  end

  validates_presence_of :tipo_habilidad, :nombre, :descripcion, message: "es un campo obligatorio"

  validates :nombre,
    :length => {
        :maximum => 255,
        :message => "tiene demasiados caracteres (maximo 255)"
  }
    
  validates :nombre, uniqueness: {
    message: "- Ya existe una habilidad con ese nombre",
    case_sensitive: false
  }

end
