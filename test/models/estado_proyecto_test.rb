require 'test_helper'

class EstadoProyectoTest < ActiveSupport::TestCase
      setup do
	    @estado_proyecto= estado_proyectos(:one)
      end

  test 'el nombre no puede estar en blanco' do
      @estado_proyecto.nombre = ''

    assert @estado_proyecto.invalid?
    assert @estado_proyecto.errors[:nombre].include?(
	      'no puede estar en blanco'
	      )
  end
end
