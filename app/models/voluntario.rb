class Voluntario < Usuario

  has_many :horario_disponibles
  has_many :experiencias
  has_many :notas
  has_many :detalle_gastos


end
