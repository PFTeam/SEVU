class Necesidad < ActiveRecord::Base
  belongs_to :usuario
  has_one :proyecto

  validates :titulo, :uniqueness => { :message => 'No pueden existir dos necesidades con el mismo nombre', :case_sensitive => false  }, :length => { :maximum => 250 }, :presence => true
  validates :descripcion, :presence => true
  validates :ambitoAplicacion, :presence => true

  def to_s
    titulo
  end
  
  def self.search query: nil, limit: false
    result = Necesidad.order 'titulo ASC'
    if query.present?
      result = result.where "#{table_name}.titulo ILIKE ?", "%#{query.strip}%"
    end
    
    limit ? result.limit(10) : result
  end

end
