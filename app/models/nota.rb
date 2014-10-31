class Nota < ActiveRecord::Base
  belongs_to :voluntario
  belongs_to :usuario
  
   # Validamos que el :titulo tenga entre 8 a 12 caracteres
   #validates :titulo, length: { in: 4..12 , message: "debe tener entre 8 y 12 caracteres"}
   validates_presence_of :voluntario, :usuario, :descripcion, :titulo, message: "- es un campo obligatorio."
# Validamos que el :titulo tenga entre 10 a 45 caracteres
    #validates :descripcion, length: { in: 5..45 , message: "debe tener entre 10 y 45 caracteres"}
end
