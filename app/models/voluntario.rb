class Voluntario < Usuario

  has_many :horario_disponibles
  has_many :experiencias
  has_many :habilidades, :through => :experiencias
  has_many :notas
  has_many :detalle_gastos
validates :legajo, :presence => {:message => "es un campo obligatorio"}


def self.search(search)

 if search 

    where('"nombreUsuario" LIKE ?', "%#{search}%")

  else

   # scoped
    nil

  end

end



end
